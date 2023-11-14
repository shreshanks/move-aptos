//sum
module my_addrx::Loops
{
    use std::debug::print;
    

    
    fun sum_using_while(n:u64) :u64
    {
        let sum=0;
        let i:u64=1;  
        while(i <= n) 
        {
            sum=sum+i;
            i=i+1;  
        }; 
        sum 
    }
    
    
    fun sum_using_loop(n:u64) :u64
    {
        let sum=0;
        let i:u64=1;
        loop
        {
            sum=sum+i;
            i=i+1;
            if(i>n)
                break;  
        };
        sum
    }



    #[test]
    fun testing()
    {
        let sum = sum_using_while(10);
        print(&sum);
        let sum = sum_using_loop(10);
        print(&sum);
    }
}
