# gt_theme_apa() formats integers with 0 decimals

    Code
      gt::extract_body(tbl)
    Output
      # A tibble: 3 x 1
        x    
        <chr>
      1   1  
      2  10  
      3 100  

# gt_theme_apa() formats doubles with dec_dig decimals

    Code
      gt::extract_body(tbl1)
    Output
      # A tibble: 2 x 1
        x    
        <chr>
      1  1.2 
      2 56.8 

---

    Code
      gt::extract_body(tbl2)
    Output
      # A tibble: 2 x 1
        x    
        <chr>
      1  1.23
      2 56.79

# gt_theme_apa() formats correlations with 3 decimals and no leading zero

    Code
      gt::extract_body(tbl)
    Output
      # A tibble: 4 x 1
        r    
        <chr>
      1 −.500
      2  .000
      3  .123
      4  .456

# gt_theme_apa() substitutes extreme doubles based on dec_dig

    Code
      gt::extract_body(tbl1)
    Output
      # A tibble: 4 x 1
        x       
        <chr>   
      1  &lt;0.1
      2      0.1
      3 &gt;99.9
      4 &gt;99.9

---

    Code
      gt::extract_body(tbl2)
    Output
      # A tibble: 4 x 1
        x    
        <chr>
      1  0.05
      2  0.10
      3 99.90
      4 99.95

# gt_theme_apa() substitutes extreme correlations based on corr_dig

    Code
      gt::extract_body(tbl1)
    Output
      # A tibble: 4 x 1
        r        
        <chr>    
      1 &lt;−.999
      2 &lt;−.999
      3  &gt;.999
      4  &gt;.999

---

    Code
      gt::extract_body(tbl2)
    Output
      # A tibble: 4 x 1
        r       
        <chr>   
      1 &lt;−.99
      2 &lt;−.99
      3  &gt;.99
      4  &gt;.99

# gt_theme_apa() skips extreme substitution when fmt_extreme = FALSE

    Code
      gt::extract_body(tbl)
    Output
      # A tibble: 2 x 2
        x     r     
        <chr> <chr> 
      1   0.1 −1.000
      2 100.0  1.000

# gt_theme_apa() applies number formatting in grouped tables

    Code
      gt::extract_body(tbl)
    Output
      # A tibble: 3 x 4
        `::group_id::` int_col dbl_col  corr_col
        <chr>          <chr>   <chr>    <chr>   
      1 A              1            1.5 .123    
      2 A              2           20.0 .456    
      3 B              3       &gt;99.9 .789    

