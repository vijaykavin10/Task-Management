package org.jira.task.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Future;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2AsyncClient;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.DescribeAvailabilityZonesRequest;
import com.amazonaws.services.ec2.model.DescribeAvailabilityZonesResult;
import com.amazonaws.services.ec2.model.Instance;
import com.amazonaws.services.ec2.model.Reservation;
import com.amazonaws.services.opsworks.model.DescribeInstancesRequest;
import com.amazonaws.services.opsworks.model.DescribeInstancesResult;

public class TestAws {

	static String awsAccessKey = "AKIAJRZEYLSIYSLVRX7Q";
	static String awsSecretKey = "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";
	
	public static void main(String args[]) {

//		getInstances();
		main();
	}
	
	public static void getInstances(){
    	
    	AWSCredentials awsCredentials = new BasicAWSCredentials(awsAccessKey, awsSecretKey);
		AmazonEC2 ec2Client = new AmazonEC2Client(awsCredentials);
		  DescribeInstancesRequest request=new DescribeInstancesRequest();
		  /*if (instanceIds != null && !instanceIds.isEmpty()) {
		    request=request.withInstanceIds(instanceIds);
		  }*/
		  com.amazonaws.services.ec2.model.DescribeInstancesResult result=ec2Client.describeInstances();
		  List<Instance> instances=new ArrayList<Instance>();
		  List<Reservation> reses=result.getReservations();
		  System.out.println("======" + result);
		  
		  if (reses != null) {
			  System.out.println("======If");
		    for (    Reservation res : reses) {
		    	System.out.println("======Reservation Id: " + res.getReservationId());
		    	System.out.println("======Instance Id: " + res.getInstances());
		      if (res.getInstances() != null && !res.getInstances().isEmpty()) {
		        for (Instance instance : res.getInstances()) {
//		          instances.add(instance);
		        	System.out.println("Instance Id: " + instance.getInstanceId());
		        }
		      }
		    }
		  }
		}
	
	public static void main() {
	    AWSCredentials awsCredentials = new BasicAWSCredentials(awsAccessKey, awsSecretKey);
	    AmazonEC2AsyncClient amazonEC2AsyncClient = new AmazonEC2AsyncClient(awsCredentials);
	    DescribeAvailabilityZonesRequest describeAvailabilityZonesRequest = new DescribeAvailabilityZonesRequest();
	    Future<DescribeAvailabilityZonesResult> describeAvailabilityZonesResultFuture = amazonEC2AsyncClient.describeAvailabilityZonesAsync(describeAvailabilityZonesRequest);
	    try {
	        DescribeAvailabilityZonesResult describeAvailabilityZonesResult = describeAvailabilityZonesResultFuture.get();
	        System.out.println(describeAvailabilityZonesResult);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
