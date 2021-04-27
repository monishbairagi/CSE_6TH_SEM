#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
int main() {
	int sockfd,fb,len,i,p;
	char b[200];
	struct sockaddr_in sa,ca;
	
	sockfd=socket(AF_INET,SOCK_STREAM,0);
	sa.sin_family=AF_INET;
	sa.sin_addr.s_addr=INADDR_ANY;
	sa.sin_port=6001;

	len=sizeof(sa);
	i= bind(sockfd,(struct sockaddr *) &sa,len);
	printf("(%d %d)\n",sockfd,i);
	listen(sockfd,5);
	fb= accept(sockfd, (struct sockaddr *) &ca,&len);
	printf("[%d]\n",fb);
	recv(fb,&p,4,0);
	printf("Client sent: %d",p);
	printf("\nGive a string to send to client: ");
	scanf("%s",b);
	send(fb,b,50,0);
}