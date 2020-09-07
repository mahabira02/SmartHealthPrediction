package Disease;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






import org.apache.catalina.Session;

import com.util.DbConnection;

import KnnAlgorithm.NearestNeighbour;
import KnnAlgorithm.NearestNeighbour.DataEntry;

/**
 * Servlet implementation class Knn
 */
@WebServlet("/Knn")
public class Knn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<NearestNeighbour.DataEntry> data = new ArrayList<NearestNeighbour.DataEntry>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Knn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String>diseases = new ArrayList<String>();
		HttpSession session = request.getSession();
		diseases = (ArrayList<String>)session.getAttribute("disease");
		
		String s11 =  (String)session.getAttribute("s1");
		int s11n = Integer.parseInt(s11);
		double s11new = s11n;
		String s22 =  (String)session.getAttribute("s2");
		int s22n = Integer.parseInt(s22);
		double s22new = s22n;
		String s33 =  (String)session.getAttribute("s3");
		int s33n = Integer.parseInt(s33);
		double s33new = s33n;
		String s44 =  (String)session.getAttribute("s4");
		int s44n = Integer.parseInt(s44);
		double s44new = s44n;
		String s55 =  (String)session.getAttribute("s5");
		int s55n = Integer.parseInt(s55);
		double s55new = s55n;
		String s66 =  (String)session.getAttribute("s6");
		int s66n = Integer.parseInt(s66);
		double s66new = s66n;
		String s77 =  (String)session.getAttribute("s7");
		int s77n = Integer.parseInt(s77);
		double s77new = s77n;
		String s88 =  (String)session.getAttribute("s8");
		int s88n = Integer.parseInt(s88);
		double s88new = s88n;
		String s99 =  (String)session.getAttribute("s9");
		int s99n = Integer.parseInt(s99);
		double s99new = s99n;
		String s110 =  (String)session.getAttribute("s10");
		int s110n = Integer.parseInt(s110);
		double s110new = s110n;
		
		System.out.println("sysmptom1==="+s11new);
		System.out.println("sysmptom2==="+s22new);
		System.out.println("sysmptom3==="+s33new);
		System.out.println("sysmptom4==="+s44new);
		System.out.println("sysmptom5==="+s55new);
		System.out.println("sysmptom6==="+s66new);
		System.out.println("sysmptom7==="+s77new);
		System.out.println("sysmptom8==="+s88new);
		System.out.println("sysmptom9==="+s99new);
		System.out.println("sysmptom10==="+s110new);
		
		
		
		
		int count=0;
		for (String str : diseases) {
			System.out.println("Predicted Disease==11=="+str);
			
			try {
				Connection con = DbConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM `datainfo` WHERE disease='"+str+"'");
				ResultSet rs = ps.executeQuery();
				
				//NearestNeighbour nn = null;
				
				while(rs.next())
				{
					count++;
					System.out.println("Count=="+count);
					String s1= rs.getString("s1");
					double s1new = Double.parseDouble(s1);
					String s2= rs.getString("s2");
					double s2new = Double.parseDouble(s2);
					String s3= rs.getString("s3");
					double s3new = Double.parseDouble(s3);
					String s4= rs.getString("s4");
					double s4new = Double.parseDouble(s4);
					String s5= rs.getString("s5");
					double s5new = Double.parseDouble(s5);
					String s6= rs.getString("s6");
					double s6new = Double.parseDouble(s6);
					String s7= rs.getString("s7");
					double s7new = Double.parseDouble(s7);
					String s8= rs.getString("s8");
					double s8new = Double.parseDouble(s8);
					String s9= rs.getString("s9");
					double s9new = Double.parseDouble(s9);
					String s10= rs.getString("s10");
					double s10new = Double.parseDouble(s10);
					
					
					
					data.add(new DataEntry(new double[]{s1new,s2new,s3new,s4new,s5new,s6new,s7new,s8new,s9new,s10new}, str));
					
					
					
				
				
				
				//System.out.println("Classified as: "+nn.classify(new DataEntry(new double[]{s11new,s22new,s33new,s44new,s55new,s66new,s77new,s88new,s99new,s110new},"Ignore")));
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	//out.println("Classified as: "+knn.classify(new DataEntry(new double[]{age9,sex9,cp9,trestbps9,chol9,fbs9,restecg9,thalach9,exang9,oldpeak9,slope9,ca9,thal9},"Ignore")));
    	out.println("<html>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h2 style='color:red;'>");
		NearestNeighbour nn = new NearestNeighbour(data, 11);
		String result = (String) nn.classify(new DataEntry(new double[]{s11new,s22new,s33new,s44new,s55new,s66new,s77new,s88new,s99new,s110new},"Ignore"));
		System.out.println("result : "+result);
		session.setAttribute("result", result);
    	out.println("Classified Result: "+nn.classify(new DataEntry(new double[]{s11new,s22new,s33new,s44new,s55new,s66new,s77new,s88new,s99new,s110new},"Ignore")));
    	out.println("</h2>");
		session.setAttribute("str", displayLatLon(result));
		out.println("<a href=recommend.jsp><h2>Click Here To See Recommended Hospital</h2></a>");
		out.println("<center>");
		out.println("</body>");
		out.println("</html>");
		
		
		//NearestNeighbour nn = new NearestNeighbour(data, 11);
		//System.out.println("Classified as: "+nn.classify(new DataEntry(new double[]{s11new,s22new,s33new,s44new,s55new,s66new,s77new,s88new,s99new,s110new},"Ignore")));
		
		
		
	}
	
	public String displayLatLon(String result)
	{
		
		String str="[";
		try {
			 Connection con = DbConnection.getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from doctor where specialist=? order by dist");
			 ps.setString(1, result);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 str=str+"{'title':'"+rs.getString("hospital")+"','lat':'"+rs.getString("lat")+"','lng':'"+rs.getString("lon")+"','description':'"+rs.getString("hospital")+"'},";
			 }
			 str = str+"]";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

}
