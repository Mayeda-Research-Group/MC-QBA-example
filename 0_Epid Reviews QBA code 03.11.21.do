
/******************************************************************************/
/* Code accompanying Epidemiologic Reviews submission						  */
/* BANACK, HAYES-LARSON, & MAYEDA											  */
/* Last revised: 03.11.21													  */
/* Stata v 16																  */
/*																			  */
/******************************************************************************/



*This do-file is intended to accompany the Tutorial provided in Section III of the
*manuscript ("Quantitative Bias Analysis Tutorial"). 

 
/******************************************************************************/
/* "1600 older adults from a local orthopedic follow-up clinic of patients recently discharged from the hospital after a hip fracture and agreed to participate in this research study. Given their interest in studying osteoporosis, recruiting from an orthopedic clinic was a sensible choice. The exposure (A) in this analysis is a binary exposure variable with two levels, diagnosed osteoporosis (A=1) and no osteoporosis (A=0). The outcome is also a binary variable, incident dementia (Y=1) and no dementia (Y=0)". */
/******************************************************************************/

cci 120 677 171 632

/******************************************************************************/
/*As a follow-up to the first analysis, the investigators decided to examine the same relationship, between osteoporosis and incident dementia, in a community sample of older adults (n=5000). For this study, they recruited participants regardless of history of hip fracture. */
/******************************************************************************/

cci 147 1353 340 3160


/******************************************************************************/
/*Approach I: Probabilistic Quantitative Bias Analysis */
/******************************************************************************/

*Note: Episens must be installed in order to run this code (ssc install episens)
*This example uses the immediate version of the episens command, episensi, since
* we are using fictitious generated data. 

episensi 120 677 171 632, reps(10000) nodots dpscex(uni(0.72 0.92)) dpscun(uni(0.40 0.60)) dpsnex(uni(0.40 0.60)) dpsnun(uni(0.10 0.30)) grarrtot saving(epidreviewsQBA.dta) 

sum adjrrselsys, detail

hist adjrrselsys

sum adjrrseltot, detail

*See data file for simulation results*


*Calculating total error (including random and systematic sources of error)

cci 120 677 171 632

display sqrt(1/120+1/677+1/171+1/632)


/******************************************************************************/
/*Approach II: Quantitative bias analysis with generated data */
/******************************************************************************/


/******************************************************************************/
/* The code for QBA with generated data based on code written by  			  */
/* Elizabeth Rose Mayeda and modified for this example						  */
/*																			  */
/* Required files to run simulation:										  */
/* 1) 1_Epid Reviews_colldier_bias_preamble.do:								  */ 
/*		-Sets parameter inputs for simulation 								  */
/* 2) 2_Epid Reviews_colldier_bias_data_gen_analysis.do: 					  */
/*		-Generates and analyzes data and stores results						  */
/* 3) 3_Epid Reviews_colldier_bias_run.do: 							 		  */ 
/*		-Runs simulation and stores results									  */
/*																			  */
/* 																			  */
/******************************************************************************/


