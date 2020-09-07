package Disease;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;



/**
 * Servlet implementation class Iterative
 */
@WebServlet("/Iterative")
public class Iterative extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Iterative() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String s11 = request.getParameter("s1");
		String s22 = request.getParameter("s2");
		String s33 = request.getParameter("s3");
		String s44 = request.getParameter("s4");
		String s55 = request.getParameter("s5");
		String s66 = request.getParameter("s6");
		String s77 = request.getParameter("s7");
		String s88 = request.getParameter("s8");
		String s99 = request.getParameter("s9");
		String s100 = request.getParameter("s10");
		
		String symp1[] = s11.split(",");
		String s1=symp1[0];
		String s1val=symp1[1];

		String symp2[] = s22.split(",");
		String s2=symp2[0];
		String s2val=symp2[1];

		String symp3[] = s33.split(",");
		String s3=symp3[0];
		String s3val=symp3[1];

		String symp4[] = s44.split(",");
		String s4=symp4[0];
		String s4val=symp4[1];

		String symp5[] = s55.split(",");
		String s5=symp5[0];
		String s5val=symp5[1];

		String symp6[] = s66.split(",");
		String s6=symp6[0];
		String s6val=symp6[1];

		String symp7[] = s77.split(",");
		String s7=symp7[0];
		String s7val=symp7[1];

		String symp8[] = s88.split(",");
		String s8=symp8[0];
		String s8val=symp8[1];

		String symp9[] = s99.split(",");
		String s9=symp9[0];
		String s9val=symp9[1];

		String symp10[] = s100.split(",");
		String s10=symp10[0];
		String s10val=symp10[1];

		System.out.println("fisrt "+s1);
		System.out.println("second "+s1val);
		
		
		session.setAttribute("s1", s1);
		session.setAttribute("s2", s2);
		session.setAttribute("s3", s3);
		session.setAttribute("s4", s4);
		session.setAttribute("s5", s5);
		session.setAttribute("s6", s6);
		session.setAttribute("s7", s7);
		session.setAttribute("s8", s8);
		session.setAttribute("s9", s9);
		session.setAttribute("s10", s10);
		
		session.setAttribute("s1val", s1val);
		session.setAttribute("s2val", s2val);
		session.setAttribute("s3val", s3val);
		session.setAttribute("s4val", s4val);
		session.setAttribute("s5val", s5val);
		session.setAttribute("s6val", s6val);
		session.setAttribute("s7val", s7val);
		session.setAttribute("s8val", s8val);
		session.setAttribute("s9val", s9val);
		session.setAttribute("s10val", s10val);
		
		System.out.println("s1val : "+s1val);
		System.out.println("s2val : "+s2val);
		System.out.println("s3val : "+s3val);
		System.out.println("s4val : "+s4val);
		System.out.println("s5val : "+s5val);
		System.out.println("s6val : "+s6val);
		System.out.println("s7val : "+s7val);
		System.out.println("s8val : "+s8val);
		System.out.println("s9val : "+s9val);
		System.out.println("s10val : "+s10val);

		System.out.println("Symptom1==="+s1);
		System.out.println("Symptom2==="+s2);
		System.out.println("Symptom3==="+s3);
		System.out.println("Symptom4==="+s4);
		System.out.println("Symptom5==="+s5);
		System.out.println("Symptom6==="+s6);
		System.out.println("Symptom7==="+s7);
		System.out.println("Symptom8==="+s8);
		
		
		
		
		
		try {
			Connection con = DbConnection.getConnection();
			//PreparedStatement ps = con.prepareStatement("SELECT * FROM datainfo WHERE s1='"+s1+"' OR s2='"+s2+"'OR s3=''"+s3+"' OR s4='"+s4+"' OR s5='"+s5+"'OR s6=''"+s6+"' OR s7='"+s7+"' OR s8='"+s8+"'OR s9=''"+s9+"' OR s10='"+s10+"'");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM datainfo WHERE s1='"+s1+"' or s2='"+s2+"' or s3='"+s3+"' or s4='"+s4+"' or s5='"+s5+"' or s6='"+s6+"' or s7='"+s7+"' or s8='"+s8+"' or s9='"+s9+"' or s10='"+s10+"'");
			ResultSet rs = ps.executeQuery();
			//IteratorAlgo algo = new IteratorAlgo();
			ArrayList<String>diseasenew = new ArrayList<String>();
			//algo.PermutationIterative(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
			while(rs.next()){
				String disease = rs.getString("disease");
				diseasenew.add(disease);
				session.setAttribute("disease", diseasenew);
				//System.out.println("Disease===="+disease);
				//
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Knn");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
