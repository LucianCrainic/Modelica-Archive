
function P
input Prm q;
input Integer k;     // il team
input Integer i;     // stato presente
input Integer j;     // stato prossimo

output Real p;       

algorithm

             
if (i == j)
      then  p := LoopProb(q.T, tau(q, i, k));

elseif (i == 1) and (j == 2)
      then p := 1 - LoopProb(q.T, tau(q, i, k));
              
elseif (2 <= i) and (i <= q.N-1) and (j == i + 1)
      then p := (1 - alpha(k, q))*(1 - LoopProb(q.T, tau(q, i, k)));
              
elseif (2 <= i) and (i <= q.N-1) and (1 <= j) and (j < i)
       then  p := alpha(k, q)*(1 - LoopProb(q.T, tau(q, i, k)))/(i - 1);

elseif (i == q.N) and (j == 1)
       then p := 1;

              
else 
    p := 0;
end if;

end P;