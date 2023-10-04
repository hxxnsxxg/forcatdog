package com.kh.forcatdog.common;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

import com.kh.forcatdog.member.model.vo.Member;

/**
 * Application Lifecycle Listener implementation class SessionMoniter
 *
 */

@Component
@WebListener
public class SessionMoniter implements HttpSessionListener, HttpSessionAttributeListener {
	private static final ConcurrentHashMap<String, HttpSession> sessionMap = new ConcurrentHashMap<String, HttpSession>();
	
	public SessionMoniter() {
		// TODO Auto-generated constructor stub
	}


	public void sessionCreated(HttpSessionEvent se) {
	}


	public void sessionDestroyed(HttpSessionEvent se) {
		Object attr = null;
		if ((attr = se.getSession().getAttribute("loginUser")) != null) {
			if (attr instanceof Member) {
				String id = ((Member) attr).getId();
				sessionMap.remove(id);
				System.out.println(id + " 로그아웃");
			}
		}
	}
	
	public void attributeAdded(HttpSessionBindingEvent se) {
		Object attr = null;
		if ((attr = se.getSession().getAttribute("loginUser")) != null) {
			if (attr instanceof Member) {
				String id = ((Member)attr).getId();

				if(sessionMap.get(id) == null) {
					System.out.println(id + " 로그인");
					sessionMap.put(id, se.getSession());
				}
			}
		}
	}
	
	public static boolean checkLoginId(Member m) {	
		String id = m.getId();
		if(sessionMap.containsKey(id)) {
			sessionMap.get(id).invalidate();
			sessionMap.remove(id);
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		
	}
}
