#ifndef __CENO_NET_MQTT_H__
#define __CENO_NET_MQTT_H__


#include "../include/packet.h"

#define EV_MQTT_BASE             0x100
#define EV_MQTT_CONNECT          (EV_MQTT_BASE + MQTT_PACKET_TYPE_CONNECT)
#define EV_MQTT_CONNACK          (EV_MQTT_BASE + MQTT_PACKET_TYPE_CONNACK)
#define EV_MQTT_PUBLISH          (EV_MQTT_BASE + MQTT_PACKET_TYPE_PUBLISH)
#define EV_MQTT_PUBACK           (EV_MQTT_BASE + MQTT_PACKET_TYPE_PUBACK)
#define EV_MQTT_PUBREC           (EV_MQTT_BASE + MQTT_PACKET_TYPE_PUBREC)
#define EV_MQTT_PUBREL           (EV_MQTT_BASE + MQTT_PACKET_TYPE_PUBREL)
#define EV_MQTT_PUBCOMP          (EV_MQTT_BASE + MQTT_PACKET_TYPE_PUBCOMP)
#define EV_MQTT_SUBSCRIBE        (EV_MQTT_BASE + MQTT_PACKET_TYPE_SUBSCRIBE)
#define EV_MQTT_SUBACK           (EV_MQTT_BASE + MQTT_PACKET_TYPE_SUBACK)
#define EV_MQTT_UNSUBSCRIBE      (EV_MQTT_BASE + MQTT_PACKET_TYPE_UNSUBSCRIBE)
#define EV_MQTT_UNSUBACK         (EV_MQTT_BASE + MQTT_PACKET_TYPE_UNSUBACK)
#define EV_MQTT_PINGREQ          (EV_MQTT_BASE + MQTT_PACKET_TYPE_PINGREQ)
#define EV_MQTT_PINGRESP         (EV_MQTT_BASE + MQTT_PACKET_TYPE_PINGRESP)
#define EV_MQTT_DISCONNECT       (EV_MQTT_BASE + MQTT_PACKET_TYPE_DISCONNECT)



#define MAX_PACKET_ID 0xFFFF

typedef enum QoS 
{
    QOS0, 
    QOS1, 
    QOS2
} QoS_e;

typedef struct mqtt_proto_data  mqtt_proto_data_t;

typedef struct mqtt_msg
{
    unsigned char type;
    QoS_e qos;
    unsigned int len;
    unsigned char retained;
    unsigned char dup;
    unsigned short id;
    void *payload;
    size_t payloadlen;
	mqtt_proto_data_t *mqtt_data;
} mqtt_msg_t;

typedef struct mqtt_suback_data
{
    QoS_e grantedQoS;
} mqtt_suback_data_t;


typedef void (*mqtt_msg_handler)(void *);

typedef struct mqtt_proto_data
{
    unsigned short keep_alive;
    time_t last_time;
    unsigned int next_packetid;
    struct MessageHandlers
    {
        unsigned char efficient;
        const char* topicFilter;
        mqtt_msg_handler cb;
    } messageHandlers[MQTT_BUILTIN_NUM];      /* Message handlers are indexed by subscription topic */
} mqtt_proto_data_t;

int mqtt_packetid(connection_t *nc);
int mqtt_connect(connection_t *nc, mqtt_connect_opt_t *options);
int mqtt_publish(connection_t *nc, mqtt_publish_opt_t *options);
int mqtt_subscribe(connection_t *nc, mqtt_subscribe_opt_t *options, mqtt_msg_handler *cbs);
int mqtt_puback(connection_t *nc, mqtt_puback_opt_t *options);
int mqtt_ping(connection_t *nc);
int mqtt_unsubscribe(connection_t *nc, mqtt_unsubscribe_opt_t *options);
void mqtt_event_handler(connection_t *nc, int event, void *event_data);

#endif // !  __CENO_NET_MQTT_H__