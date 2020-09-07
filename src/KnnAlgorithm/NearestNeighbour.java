package KnnAlgorithm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * 
 * @author PRAMOD PAWAR
 *
 *
 * An implementation of knn.
 * 
 */
public class NearestNeighbour{
	
	public NearestNeighbour() {
		// TODO Auto-generated constructor stub
	}
	public static void main(String[] args){
		//ArrayList<NearestNeighbour.DataEntry> data = new ArrayList<NearestNeighbour.DataEntry>();
		
	}
	
	
	private int k;
	private ArrayList<Object> classes;
	private ArrayList<DataEntry> dataSet;
	/**
	 * 
	 * @param dataSet The set
	 * @param k The number of neighbours to use
	 */
	public NearestNeighbour(ArrayList<DataEntry> dataSet, int k){
		this.classes = new ArrayList<Object>();
		this.k = k;
		this.dataSet = dataSet;
		
		//Load different classes
		for(DataEntry entry : dataSet){
			if(!classes.contains(entry.getY())) classes.add(entry.getY());
		}
	}
	
	private DataEntry[] getNearestNeighbourType(DataEntry x){
		DataEntry[] retur = new DataEntry[this.k];
		double fjernest = Double.MIN_VALUE;
		int index = 0;
		for(DataEntry tse : this.dataSet){
			double distance = distance(x,tse);
			if(retur[retur.length-1] == null){ //Hvis ikke fyldt
				int j = 0;
				while(j < retur.length){
					if(retur[j] == null){
						retur[j] = tse; break;
					}
					j++;
				}
				if(distance > fjernest){
					index = j;
					fjernest = distance;
				}
			}
			else{
				if(distance < fjernest){
					retur[index] = tse;
					double f = 0.0;
					int ind = 0;
					for(int j = 0; j < retur.length; j++){
						double dt = distance(retur[j],x);
						if(dt > f){
							f = dt;
							ind = j;
						}
					}
					fjernest = f;
					index = ind;
				}
			}
		}
		return retur;
	}
	
	private static double convertDistance(double d){
		return 1.0/d;
	}

	/**
	 * Computes Euclidean distance
	 * @param a From
	 * @param b To
	 * @return Distance 
	 */
	public static double distance(DataEntry a, DataEntry b){
		double distance = 0.0;
		int length = a.getX().length;
		for(int i = 0; i < length; i++){
			double t = a.getX()[i]-b.getX()[i];
			distance = distance+t*t;
		}
		return Math.sqrt(distance);
	}
	/**
	 * 
	 * @param e Entry to be classifies
	 * @return The class of the most probable class
	 */
	public Object classify(DataEntry e){
		HashMap<Object,Double> classcount = new HashMap<Object,Double>();
		DataEntry[] de = this.getNearestNeighbourType(e);
		for(int i = 0; i < de.length; i++){
			double distance = NearestNeighbour.convertDistance(NearestNeighbour.distance(de[i], e));
			if(!classcount.containsKey(de[i].getY())){
				classcount.put(de[i].getY(), distance);
			}
			else{
				classcount.put(de[i].getY(), classcount.get(de[i].getY())+distance);
			}
		}
		//Find right choice
		Object o = null;
		double max = 0;
		for(Object ob : classcount.keySet()){
			if(classcount.get(ob) > max){
				max = classcount.get(ob);
				o = ob;
			}
		}
		
		return o;
	}

public static class DataEntry{
	private double[] x;
	private Object y;
	
	public DataEntry(double[] x, Object y){
		this.x = x;
		this.y = y;
	}
	
		public double[] getX(){
			return this.x;
		}
	
		public Object getY(){
			return this.y;
		}
	}

public static double distance(double lat1, double lon1, double lat2,
		double lon2, String unit) {
	double theta = lon1 - lon2;
	double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
			+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
			* Math.cos(deg2rad(theta));
	dist = Math.acos(dist);
	dist = rad2deg(dist);
	dist = dist * 60 * 1.1515;
	if (unit == "K") {
		dist = dist * 1.609344;
	} else if (unit == "N") {
		dist = dist * 0.8684;
	}

	return (dist);
}

/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
/* :: This function converts decimal degrees to radians : */
/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
private static double deg2rad(double deg) {
	return (deg * Math.PI / 180.0);
}

/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
/* :: This function converts radians to decimal degrees : */
/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
private static double rad2deg(double rad) {
	return (rad * 180 / Math.PI);
}



}