PROBLEM DESCRIPTION

In a merchandise shop, several types of goods are processed daily, where they are eventually distributed to  buyers  in  the  form  of  triplets,  in  which  both  every  pair  has  to  be  compatible  with  each  other  and every item is of a distinct type.  Equal quantities per goods category arrive in 24 hours time and they are initially stored in the inventory, where their compatibility information is recorded as an undirected graph. The  number  of  distinct  goods  types  to  be  processed  within  a  day  is  a  Poisson  random  variable  with λ= 160. 

After the gathering of goods is complete, an undirected graph whose number of vertices equals the number of goods types is constructed such that there exists an edge between two vertices if and only if the goods they indicate are compatible.  Otherwise, the said goods types are incompatible, and consequently their reciprocal vertices are not connected by edges. 


The  undirected  graph  should  be  represented  as  a  symmetric  square  matrix G,  whose  number  of  rows(columns) is equal to the number of collected goods types.  The entries of the matrix are chosen from the set {0,1}, where 1's indicate the existence, and 0's, the absence of corresponding edges.  Due to the randomness of the goods characteristics in terms of the compatibility criterion, the undirected graph isformed through Bernoulli trials with p given as the probability that an edge is present, i.e.  its associatedentry in G is 1.  


Since we are interested in triplets of distinct goods types given the distribution condition,goods of the same type must be assumed incompatible.Your  task  is  to  estimate  the  the  number  different  choices  the  merchant  can  make  for  the  first  ship-ment of the day, based on given p values.  For that purpose, you will compute the number of triangles as sets of three vertices of the graph such that every pair is connected with an edge.  


You must estimate both the total number of triangles and the ratio of the number of triangles to the number of all distinct triplets of vertices.Conduct Monte Carlo simulations to answer the subsequent questions. For each option, with probability 0.98, your answer should differ from the true value by no more than 0.03.  Use Normal approximation to determine the size of your Monte Carlo simulation.     