First, I combined the training and test x and y and subject labels into one data frame.  I then used merge to attach the one- word activity labels to this data frame.  Next, I made the headings easier to read and attached them to the data frame.
I then extracted the variables that ended in mean or standard deviation.  There were 66 fields extracted and they are shown below.  Many are time series data that was split into body and gravity parts.  Jerk is defined as the velocity of acceleration or third derivative of position

time series body acceleration -mean()-x
time series body acceleration -mean()-y
time series body acceleration -mean()-z
time series body acceleration -std()-x
time series body acceleration -std()-y
time series body acceleration -correlation()-y,z
time series gravity acceleration -mean()-x
time series gravity acceleration -mean()-y
time series gravity acceleration -mean()-z
time series gravity acceleration -std()-x
time series gravity acceleration -std()-y
time series gravity acceleration -correlation()-y,z
time series body acceleration jerk -mean()-x
time series body acceleration jerk -mean()-y
time series body acceleration jerk -mean()-z
time series body acceleration jerk -std()-x
time series body acceleration jerk -std()-y
time series body acceleration jerk -correlation()-y,z
time series body gyroscope -mean()-x
time series body gyroscope -mean()-y
time series body gyroscope -mean()-z
time series body gyroscope -std()-x
time series body gyroscope -std()-y
time series body gyroscope -correlation()-y,z
time series body gyroscope jerk -mean()-x
time series body gyroscope jerk -mean()-y
time series body gyroscope jerk -mean()-z
time series body gyroscope jerk -std()-x
time series body gyroscope jerk -std()-y
time series body gyroscope jerk -correlation()-y,z
time series body acceleration magnitude -mean()
time series body acceleration magnitude -arcoeff()4
time series gravity acceleration magnitude -mean()
time series gravity acceleration magnitude -arcoeff()4
time series body acceleration jerk magnitude -mean()
time series body acceleration jerk magnitude -arcoeff()4
time series body gyroscope magnitude -mean()
time series body gyroscope magnitude -arcoeff()4
time series body gyroscope jerk magnitude -mean()
time series body gyroscope jerk magnitude -arcoeff()4
frequency domain body acceleration -mean()-x
frequency domain body acceleration -mean()-y
frequency domain body acceleration -mean()-z
frequency domain body acceleration -std()-x
frequency domain body acceleration -std()-y
frequency domain body acceleration -bandsenergy()-25,48
frequency domain body acceleration jerk -mean()-x
frequency domain body acceleration jerk -mean()-y
frequency domain body acceleration jerk -mean()-z
frequency domain body acceleration jerk -std()-x
frequency domain body acceleration jerk -std()-y
frequency domain body acceleration jerk -bandsenergy()-25,48
frequency domain body gyroscope -mean()-x
frequency domain body gyroscope -mean()-y
frequency domain body gyroscope -mean()-z
frequency domain body gyroscope -std()-x
frequency domain body gyroscope -std()-y
frequency domain body gyroscope -bandsenergy()-25,48
frequency domain body acceleration magnitude -mean()
frequency domain body acceleration magnitude -kurtosis()
frequency domain body bodyacceleration jerk magnitude -mean()
frequency domain body bodyacceleration jerk magnitude -kurtosis()
frequency domain body bodygyroscope magnitude -mean()
frequency domain body bodygyroscope magnitude -kurtosis()
frequency domain body bodygyroscope jerk magnitude -mean()
subject
activity

I then grouped these 66 fields by both subject and activity and calculated means for each measurement field.  This was done using the melt and dcast functions in the reshape2 package of R.  The data frame produced was then uploaded to the coursera assessment webpage.
Finally, the R-script used to make these calculations was uploaded to this repo and it is called run_analysis.R.  The script can be pasted into an empty script file and run in R-studio.  The script and all data files should be placed in the working directory to run the script properly.

