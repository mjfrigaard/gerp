# Names

``` r

library(gerp)
```

> “*It ain’t what they call you, it’s what you answer to.*” - [W.C.
> Fields](https://www.goodreads.com/quotes/130631-it-ain-t-what-they-call-you-it-s-what-you-answer)

## Files

The names for files and folders come from Jenny Bryan’s excellent
[‘Naming things’
slides](https://www.slideshare.net/milkers/naming-things)

### Naming files

Below I’ll cover how these principles are implemented in
[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md)

#### 1. **Machine readable**: file names should be useful to program with, i.e., easy to search and filter, avoid reliance on case, accented characters, white space, etc.

*[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md)
will convert all names to lower kebab-case and add a date prefix.*

``` r

grp_fname("My File.txt")
```

    ✔ '2023-04-09_my-file.txt' is copied to the clipboard!

#### 2. **Human readable**: File names should be named similar to URLs. Specifically, the portion of the URL that “*is usually the end part of the URL (specifically of the path / pathinfo part), which can be interpreted as the name of the resource, similar to the basename in a filename or the title of a page*” is referred to as the [slug](https://en.wikipedia.org/w/index.php?title=Clean_URL#Slug) for brief description of file contents).

*[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md)
removes special characters (but keeps words):*

``` r

grp_fname("%Joe's%crazy*!$#FILE%name.xlsx")
```

    ✔ '2023-04-09_joes-crazy-file-name.xlsx' is copied to the clipboard!

#### 3. **Easily sorted/ordered**: If a logical order for the files in a directory exists, the filenames should include a numeric prefix that contains the inherent order, with sufficient left-side padding (i.e., `01-import.R`, `02-wrangle.R`, `03-model.R`, etc.).

*[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md)
conserves numeric prefixes (and appends a date prefix):*

``` r

grp_fname("01-report.xlsx")
```

    ✔ '2023-04-09_01-report.xlsx' is copied to the clipboard!

### Summary

`gerp` names have the following format:

1.  All file names should be [lower
    kebab-case](https://en.wikipedia.org/wiki/Naming_convention_(programming)#Delimiter-separated_words),
    with no white space

2.  A date prefix is appended to all files for provenance, with a
    trailing underscore (`YYYY-MM-DD_`). The underscore makes it
    distinguishable from rest file name:

&nbsp;

    2023-04-09_my-file.txt
              ^

3.  Special characters and punctuation (outside the file extension) are
    removed

``` r

gerp::grp_fname("Some===crazy???long:::file;name.csv")
```

    ✔ '2023-04-09_some-crazy-long-file-name.csv' is copied to the clipboard!

## Objects

Names for R objects come from the [`tidyverse` style
guide](https://style.tidyverse.org/syntax.html). New users to R can find
names confusing when choosing what to name R objects vs. names for R
project files. The principles for naming files covered above can (and
arguably should) be adopted to make file organization easier and more
uniform. However, some of these principles can’t be applied to R
objects.

### Naming objects

Below I’ll cover the style guide’s [advice on object
names](https://style.tidyverse.org/syntax.html#object-names) and how
they are implemented in
[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md).

#### 1. Only use lowercase letters, numbers, and underscores (i.e. `snake_case`)

*[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
converts all characters to `snake_case`*

``` r

gerp::grp_name("MY DATA")
```

    ✔ 'my_data' is copied to the clipboard!

*In the event the object name starts with a number,
[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
places these at the end of the name*

``` r

gerp::grp_name("2022 DATA")
```

    ✔ 'data_2022' is copied to the clipboard!

*Pure numbers will automatically converted to `num_var`*

``` r

gerp::grp_name("2022")
```

    ✔ 'num_var' is copied to the clipboard!

*Any object names that start with special characters or punctuation are
also altered to be accetable*

``` r

gerp::grp_name("__my data__")
```

    ✔ 'my_data' is copied to the clipboard!

#### 2. Avoid using dots (i.e., `my.object`)

*dots are assumed to contain some inherent meaning to the object name,
so dots are replaced with underscores*

``` r

gerp::grp_name("patient.data")
```

    ✔ 'patient_data' is copied to the clipboard!

*Unless the name has trailing dots (these are preserved in the event
they belong to a meaningful file extension)*

``` r

gerp::grp_name("---patient/data.csv")
```

    ✔ 'patient_data_csv' is copied to the clipboard!

#### 3. Be concise and meaningful (i.e., not `first_day_of_the_month`, but rather, `day_one`)

*If the object has a long name, set `abbr` to `TRUE` to reduce it’s
length to 18 characters*

``` r

gerp::grp_name("first_day_of_the_month", abbr = TRUE)
```

    ✔ 'first_dy_f_th_mnth' is copied to the clipboard!

## Additional features

*[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
replaces the following symbols with abbreviations:*

``` r

gerp::grp_name("~ ! @ # $ % ^ & * — = +")
```

    ✔ 'tilde_bang_at_num_dollar_perc_hat_and_ast_emdash_equals_plus' is copied to the clipboard!

pk \> *It also reorganizes names with numbers prefixes:*

``` r

grp_name("20 % of this & that")
```

    ✔ 'perc_of_this_and_that_20' is copied to the clipboard!

> *[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
> converts just about any string of characters into something that can
> be assigned to R variables.*

``` r

grp_name("123456 ! bingo + bongo")
```

    ✔ 'bang_bingo_plus_bongo_123456' is copied to the clipboard!

> *To ensure the names aren’t too long or repeat terms,
> [`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
> won’t repeat symbols*

``` r

gerp::grp_name("... !! ++")
```

    ✔ 'bang_plus' is copied to the clipboard!
