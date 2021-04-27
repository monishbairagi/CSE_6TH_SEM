#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
int main() {
	int sockfd,len,i,a;
	char q[200];
	struct sockaddr_in sa,ca;
	
	sockfd=socket(AF_INET,SOCK_STREAM,0);
	sa.sin_family=AF_INET;
	sa.sin_addr.s_addr=inet_addr("127.0.0.1");
	sa.sin_port=6001;

	len=sizeof(sa);
	i= connect(sockfd,(struct sockaddr *) &sa,len);
	printf("(%d %d)\n",sockfd,i);
	printf("Give a number for the server: ");
	scanf("%d",&a);
	send(sockfd,&a,4,0);
	recv(sockfd,q,50,0);
	printf("Server sent: %s\n",q);
}