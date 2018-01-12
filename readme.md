A quick visualization for the Pratt Institute School of Information Peer Review Committee of my student evaluations. 

[![Student evaluation heatmap](/evaluations.png)](/evaluations.png)

The information is available to students (for all courses!) through the Pratt Library, and I encourage them to make use of the class evaluations when deciding which courses to take. 

While the base heatmap methods of ggplot2 are killer out of the box, many of refinements on this particular visualization are a bit hacky, particularly around getting the right row order. That said, if others have their student evaluation information in a useful format, should be pretty easy to repurpose this code to get similar results. 

Data is in this form: 

|evaluation question|semester 1 score|semester 2 score|weighted average|display order|display text of evaluation question|
|--------------------|---------------|----------------|----------------|-------------|-----------------------------------|
|Was a great teacher|3.5|3.4|3.42|1|Was an effective teacher|