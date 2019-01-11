#include "../../include/net.h"
#include "../include/mqtt.h"

int mqtt_packetid(connection_t *nc){

}

int mqtt_connect(connection_t *nc, mqtt_connect_opt_t *options){
	
}

int mqtt_publish(connection_t *nc, mqtt_publish_opt_t *options){

}

int mqtt_subscribe(connection_t *nc, mqtt_subscribe_opt_t *options, mqtt_msg_handler *cbs){

}

int mqtt_puback(connection_t *nc, mqtt_puback_opt_t *options){

}

int mqtt_ping(connection_t *nc){

}

int mqtt_unsubscribe(connection_t *nc, mqtt_unsubscribe_opt_t *options){

}

void mqtt_event_handler(connection_t *nc, int event, void *event_data){

}

