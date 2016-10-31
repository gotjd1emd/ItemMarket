package websocket;

import java.io.IOException;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/webSocket/{userID}")
public class WebSocketServer {
	
	private static Set<WebSocketServer> clients = new CopyOnWriteArraySet<WebSocketServer>();
	private String userID;
	private Session session;

	@OnMessage
	public void onMessage(String message) {

		StringTokenizer token = new StringTokenizer(message, "|");
		String you = token.nextToken();
		String sendMessage = userID + " : " + token.nextToken();
		System.out.println(you + "님에게 전송 : " + sendMessage);
		sendMessage(sendMessage, you);
	}

	@OnOpen
	public void onOpen(Session session, @PathParam(value = "userID") String userID) {
		// Add Session to the connected sessions set

		System.out.println(session);
		System.out.println(userID + "님께서 로그인하셨습니다.");
		
		this.session = session;
		this.userID = userID;
		clients.add(this);
		System.out.println("현재 접속자 수 : " + clients.size());
	}

	@OnClose
	public void onClose() {
		// Remove session from the connected session set
		clients.remove(this);
	}

	public String getUserID() {
		return userID;
	}

	private void sendMessage(String message, String you) {
		boolean flag = true;
		for(WebSocketServer client : clients) {
			if(client.getUserID().equals(you)) {
				synchronized (client) {
					try {
						client.session.getBasicRemote().sendText(message);
						flag = false;
					}catch (IOException e) {
						clients.remove(this);
						System.out.println("삭제");
						try {
							client.session.close();
						}catch(IOException e1) {
							e1.printStackTrace();
						}
						System.out.println(userID + "님 연결종료");
					}
				}
			}
		}
		if(flag) {
			for(WebSocketServer client : clients) {
				synchronized (client) {
					try {
						if(client.getUserID().equals(this.userID)) {
							client.session.getBasicRemote().sendText(you+"님은 접속해있지 않습니다.");
						}
					}catch (IOException e) {
						e.printStackTrace();
					}
				}
				
			}
		}
	}
}
