#ifndef __CENO_NET_MQTT_PACKET_H__
#define __CENO_NET_MQTT_PACKET_H__

/**
 * MQTT 报文定义
 * https://mcxiaoke.gitbooks.io/mqtt-cn/content/mqtt/02-ControlPacketFormat.html
 */




#define MQTT_PACKET_LEN_BIT_NUM (7)
#define MQTT_PACKET_LEN_MASK    (1 << MQTT_PACKET_LEN_BIT_NUM)

#define MQTT_PACKET_MAX_LEN     (4)


enum errors
{
	MQTTPACKET_BUFFER_TOO_SHORT = -2,
	MQTTPACKET_READ_ERROR = -1,
	MQTTPACKET_READ_COMPLETE
};

/**
 * 控制报文类型
 */
typedef enum mqtt_packet_type
{
    MQTT_PACKET_TYPE_RESERVED    = 0,	//Reserved		0	禁止		  保留
    MQTT_PACKET_TYPE_CONNECT     = 1,	//CONNECT		1	客户端到服务端	客户端请求连接服务端
    MQTT_PACKET_TYPE_CONNACK     = 2,	//CONNACK		2	服务端到客户端	连接报文确认
    MQTT_PACKET_TYPE_PUBLISH     = 3,	//PUBLISH		3	两个方向都允许	发布消息
    MQTT_PACKET_TYPE_PUBACK      = 4,	//PUBACK		4	两个方向都允许	QoS 1消息发布收到确认
    MQTT_PACKET_TYPE_PUBREC      = 5,	//PUBREC		5	两个方向都允许	发布收到（保证交付第一步）
    MQTT_PACKET_TYPE_PUBREL      = 6,	//PUBREL		6	两个方向都允许	发布释放（保证交付第二步）
    MQTT_PACKET_TYPE_PUBCOMP     = 7,	//PUBCOMP		7	两个方向都允许	QoS 2消息发布完成（保证交互第三步）
    MQTT_PACKET_TYPE_SUBSCRIBE   = 8,	//SUBSCRIBE		8	客户端到服务端	客户端订阅请求
    MQTT_PACKET_TYPE_SUBACK      = 9,	//SUBACK		9	服务端到客户端	订阅请求报文确认
    MQTT_PACKET_TYPE_UNSUBSCRIBE = 10,	//UNSUBSCRIBE	10	客户端到服务端	客户端取消订阅请求
    MQTT_PACKET_TYPE_UNSUBACK    = 11,	//UNSUBACK		11	服务端到客户端	取消订阅报文确认
    MQTT_PACKET_TYPE_PINGREQ     = 12,	//PINGREQ		12	客户端到服务端	心跳请求
    MQTT_PACKET_TYPE_PINGRESP    = 13,	//PINGRESP		13	服务端到客户端	心跳响应
    MQTT_PACKET_TYPE_DISCONNECT  = 14,	//DISCONNECT	14	客户端到服务端	客户端断开连接
    MQTT_PACKET_TYPE_MAX         = 15,	//Reserved		15	禁止	      保留 
} mqtt_packet_type_e; 


#define MQTT_PROTO_NAME_LEN      (2)
#define MQTT_PROTO_NAME_SIZE     (4)
#define MQTT_PROTO_LEVEL         (4)

#define MQTT_STRING_LEN          (2)
#define MQTT_DATA_LEN            (2)
#define MQTT_QOS_LEN             (1)

#define MQTT_CONNECT_HEAD_INIT {{0, MQTT_PROTO_NAME_SIZE}, {'M', 'Q', 'T', 'T'}, MQTT_PROTO_LEVEL, {0}, 0}
#define MQTT_CONNECT_OPT_INIT {{{0, MQTT_PROTO_NAME_SIZE}, {'M', 'Q', 'T', 'T'}, MQTT_PROTO_LEVEL, {0}, 0}, {NULL, NULL, NULL, NULL, NULL}}


/**
 * 固定报头
 */
typedef struct mqtt_fix_head
{
    union
    {
        unsigned char byte;
        struct
        {
            unsigned char retain : 1;	//PUBLISH报文的保留标志
            unsigned char qos : 2;		//PUBLISH报文的服务质量等级
            unsigned char dup : 1;		//控制报文的重复分发标志
            unsigned char type : 4;
        } bits;
    } mqtt_first_byte_u;
	/**
	 * 剩余长度（Remaining Length）表示当前报文剩余部分的字节数，包括可变报头和负载的数据。
	 * 剩余长度不包括用于编码剩余长度字段本身的字节数。
	 * 
	 * 1个字节时，从0(0x00)到127(0x7f)
	 * 2个字节时，从128(0x80,0x01)到16383(0Xff,0x7f)
	 * 3个字节时，从16384(0x80,0x80,0x01)到2097151(0xFF,0xFF,0x7F)
	 * 4个字节时，从2097152(0x80,0x80,0x80,0x01)到268435455(0xFF,0xFF,0xFF,0x7F)
	 * */
    unsigned char remaining_len[MQTT_PACKET_MAX_LEN]; 
} mqtt_fix_head_t;


typedef struct mqtt_connect_head
{
    unsigned char proto_len[MQTT_PROTO_NAME_LEN];
    unsigned char proto_name[MQTT_PROTO_NAME_SIZE];
    unsigned char proto_level; // 协议级别
    union
    {
        unsigned char connect_flag;
        struct
        {
            unsigned char reserved : 1;
            unsigned char clean_session : 1;	// 清理会话
            unsigned char will_flag : 1;		// 遗嘱标志
            unsigned char will_qos : 2;			// 遗嘱QOS
            unsigned char will_retain : 1;		// 遗嘱保留
            unsigned char psd_flag : 1;			// 密码标志符
            unsigned char user_name_flag : 1;	// 用户名标志符
        } bits; // 连接标志位
    } mqtt_connect_flag_u;
    unsigned short keep_alive;					// 保持连接
} mqtt_connect_head_t;


/**
 * 有效载荷
 */
typedef struct mqtt_connect_payload
{
    char *client_id;		// 客户端标志符号
    char *will_topic;		// 遗嘱主题
    char *will_msg;			// 遗嘱消息
    char *user_name;		// 用户名
    char *password;			// 密码
} mqtt_connect_payload_t;


typedef struct mqtt_connect_opt
{
    mqtt_connect_head_t connect_head;
    mqtt_connect_payload_t connect_payload;
} mqtt_connect_opt_t;


typedef struct mqtt_publish_head
{
    char *topic;
    unsigned short topic_len;
    unsigned short packet_id;
} mqtt_publish_head_t;


typedef struct mqtt_publish_payload
{
    char *msg;
    size_t msg_len;
} mqtt_publish_payload_t;


typedef struct mqtt_publish_opt
{
    mqtt_publish_head_t publish_head;
    mqtt_publish_payload_t publish_payload;
    unsigned char dup;
    unsigned char qos;
    unsigned char retain;
} mqtt_publish_opt_t;


typedef struct mqtt_subscribe_head
{
    unsigned short packet_id;
} mqtt_subscribe_head_t;


typedef struct mqtt_subscribe_payload
{
    unsigned char count;
    char **topic;
    unsigned char qoss[0];
} mqtt_subscribe_payload_t;


typedef struct mqtt_subscribe_opt
{
    mqtt_subscribe_head_t subscribe_head;
    mqtt_subscribe_payload_t subscribe_payload;
} mqtt_subscribe_opt_t;


typedef struct mqtt_unsubscribe_head
{
    unsigned short packet_id;
} mqtt_unsubscribe_head_t;


typedef struct mqtt_unsubscribe_payload
{
    unsigned char count;
    char **topic;
} mqtt_unsubscribe_payload_t;


typedef struct mqtt_unsubscribe_opt
{
    mqtt_unsubscribe_head_t unsubscribe_head;
    mqtt_unsubscribe_payload_t unsubscribe_payload;
} mqtt_unsubscribe_opt_t;


typedef struct mqtt_suback_head
{
    unsigned short packet_id;
} mqtt_suback_head_t;


typedef struct mqtt_suback_payload
{
    unsigned char ret_code[0];
} mqtt_suback_payload_t;


typedef struct mqtt_suback_opt
{
    unsigned char count;
    mqtt_suback_head_t suback_head;
    mqtt_suback_payload_t suback_payload;
} mqtt_suback_opt_t;


typedef struct mqtt_puback_head
{
    unsigned short packet_id;
} mqtt_puback_head_t;


typedef struct mqtt_puback_payload
{
    unsigned char null[0];
} mqtt_puback_payload_t;


typedef struct mqtt_puback_opt
{
    unsigned char type;
    mqtt_puback_head_t puback_head;
    mqtt_puback_payload_t puback_payload;
} mqtt_puback_opt_t;



int mqtt_encode_fixhead(unsigned char *buf, unsigned char type, unsigned char dup,
                                unsigned char qos, unsigned char retain, int remaining_len);
int mqtt_encode_connect(unsigned char *buf, int buf_len, mqtt_connect_opt_t *options);
int mqtt_encode_publish(unsigned char *buf, int buf_len, mqtt_publish_opt_t *options);
int mqtt_encode_subscribe(unsigned char *buf, int buf_len, mqtt_subscribe_opt_t *options);
int mqtt_encode_ping(unsigned char *buf, int buf_len);
int mqtt_decode_fixhead(unsigned char *buf, unsigned char *type, unsigned char *dup,
                                unsigned char *qos, unsigned char *retain, int *remaining_len);
int mqtt_decode_publish(unsigned char *buf, int buf_len, mqtt_publish_opt_t *options);
int mqtt_decode_suback(unsigned char *buf, int buf_len, mqtt_suback_opt_t *options);
int mqtt_encode_puback(unsigned char *buf, int buf_len, mqtt_puback_opt_t *options);
int mqtt_encode_unsubscribe(unsigned char *buf, int buf_len, mqtt_unsubscribe_opt_t *options);


#endif // ! __CENO_NET_MQTT_PACKET_H__