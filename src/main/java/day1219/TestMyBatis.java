package day1219;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class TestMyBatis {
	public static void main(String[] args) {
		
		try {
			Reader reader= Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");
			System.out.println(reader);
			//2.읽어들ㅇ니 stream을 사용 mybatisframework생성
			/*
			 * SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			 * SqlSessionFactory sff=ssfb.build(reader);
			 */
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(reader);		
			System.out.println(ssf);
			
			//3.mybatis handler 얻기
			SqlSession ss=ssf.openSession();
			
			//4.handler를 ㅇ사용하여 mybatis사용
			DeptDTO dd=new DeptDTO(90,"개발부","서울"	);
			int cnt=ss.insert("day1219.insertDept",dd);
			if(cnt==1) {
				ss.commit();
			}

		
			List<String> list=ss.selectList("day1219.selectDept");
			System.out.println(list);
			
			//5.연결끊기
			ss.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//main
}
//class
