

/******************************************************************************/
/* Code accompanying Epidemiologic Reviews submission						  */
/* BANACK, HAYES-LARSON, & MAYEDA											  */
/* Last revised: 03.11.21													  */
/* Stata v 16																  */
/*																			  */
/******************************************************************************/

/******************************************************************************/
/* The purpose of this file is to set the parameter values (stored as 		  */
/* global macro variables) to be used in the data-generation and analysis 	  */ 
/* file. This way, you can have separate files for different parameter sets   */ 
/* and use one file for the data-generation and analysis code. 		 		  */
/* If a specific path is not included for a given causal structure of 		  */ 
/* interest, set the parameter to 0.										  */
/******************************************************************************/


/*******************************************************/
/******** Set parameters						********/
/*******************************************************/
global B = 1000         		//number of iterations of sample generation
global num_obs = 5000   		//number of observations in each sample

*Specify prevalence of A (exposure)
global P_A = 0.2	 

*Parameters for odds of S (selection)
global g0 = ln(0.10/(1-0.10)) 	//log odds of S for ref group (A=0 and U=0) 
global g1 = ln(5.0)				//log OR for effect of A on log odds of selection (OR=5.0)	
global g2 = ln(5.0)				//log OR for effect of U on log odds of selection (OR=5.0)
global g3 = ln(1.0)				//log OR for interaction between A and U on  (OR=1.0)


*Parameters for odds of Y (outcome)
global b0 = ln(0.05/(1-0.05)) 	//log odds of Y for ref group (A=0, U=0, and S=0)
global b1 = ln(1.0)				//log OR for effect of A on log odds of Y (OR=1.0) 
global b2 = ln(5.0)				//log OR for effect of U on log odds of Y (OR=5.0)
