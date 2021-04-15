String s1 = "Morse code is cool and...."; 
     
String s2 = "mor code is co and...";

String s3 = "Morse code...."; 

// the code for this is in the 2nd tab
// this will calculate the distance of difference between two strings
// a distance of 0 means they are exactly the same
// the higher the distance, the farther away the strings are from each other
// try comparing string s1 to s1, to s2, and to s3 to see the differences
int d = LevenshteinDistance.computeDistance(s1, s1);
println("The distance between the two strings is: " + d);

// taken from here: https://forum.processing.org/one/topic/how-can-i-calculate-similarity-score-of-strings.html
