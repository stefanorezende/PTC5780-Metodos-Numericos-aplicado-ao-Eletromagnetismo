p = [10 0 0 0 0 0 0 0 0 0]
n = 0
i = 0
while i<51

    for n=1:length(p)
        if n-1 <1
            continue
        end
        if n+1>length(p)
            continue
        end
    p(n)= (p(n-1)+ p(n+1))/2
    n = n +1
    end
 i = i+1
end