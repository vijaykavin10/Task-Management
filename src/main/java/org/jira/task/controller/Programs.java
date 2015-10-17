package org.jira.task.controller;

public class Programs {

	Programs programs = new Programs();
	
	public static void main(String[] args)
    {
		/*
        B b = new B();
 
        System.out.println(b.i);
        */
		
		checkIntegerState();
		
		/*Integer int1 = new Integer(null);
		System.out.println(int1);*/
		
//		String s1 = new String(null);
		
		int i = 10 - -  1;
		System.out.println(i);
		checkPlusOperator();
        
    }
	
	public static void checkPlusOperator() {
		String s = "ONE"+1+2+"TWO"+"THREE"+3+4+"FOUR"+"FIVE"+5; 
		 
        System.out.println(s);
	}
	
	public static void checkIntegerState() {
		System.out.println("Check Integer State:");
		
		Integer i1 = 127;
		Integer i2 = 127;
		
		System.out.println(i1 == i2);
		
		Integer i3 = 128;
		Integer i4 = 128;
		
		System.out.println(i3 == i4);
	}
}

class A
{
    static int i = 1111;
 
    static
    {
    	System.out.println("A Static Before : " + i);
        i = i-- - --i;
        System.out.println("A Static After : " + i);
    }
 
    {
    	System.out.println("A Before : " + i);
        i = i++ + ++i;
        System.out.println("A After : " + i);
    }
}
 
class B extends A
{
    static
    {   System.out.println("B Static Before: " + i);
        i = --i - i--;
        System.out.println("B Static After: " + i);
    }
 
    {
    	System.out.println("B Before: " + i);
        i = ++i + i++;
        System.out.println("B After: " + i);
    }
}