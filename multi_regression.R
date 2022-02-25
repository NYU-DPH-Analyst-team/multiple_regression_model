#Hello everyone

INL=c("MeanThickness_INL_RegionAverage_um", "MeanThickness_INL_RegionSuperior_um",
      "MeanThickness_INL_RegionInferior_um", "MeanThickness_INL_tempsup_um", 
      "MeanThickness_INL_sup_um", "MeanThickness_INL_nassup_um", 
      "MeanThickness_INL_nasinf_um", "MeanThickness_INL_inf_um",  
      "MeanThickness_INL_tempinf_um")
      
result_INL=list()
for (i in INL){
  formula=paste(y, "~duration + age + ss_GCIPL + (1|subject_id)")
  mod=lmer(as.formula(formula), data=data,
           control = lmerControl(optimizer ="Nelder_Mead"))
  result_INL=c(result_INL, list(formula, coef(summary(mod))))
}

capture.output(result_INL, file = "result_INL.txt")
