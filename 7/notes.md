# Notes

So, I don't know anything about computer science, but I am not entirely useless.
I thought about this problem overnight, and I've come up with an approach to
this puzzle. There may be a better way of doing this, but I'm also doing this in
bash, so I might be mildly limited in that respect.

Anyways, I intend to parse the input into a list of lists as follows:
- Every time there's a `cd` command, I'll set a current working directory
  variable (CWD)
  - This variable will be used to set a new "key" in my array, i.e.
    ARRAY[$CWD]=[blah]
- Every time there's an `ls` command, I'll read in lines until the next command
  (denoted by the `$` character, as in the puzzle prompt
  - These lines will be parsed and input into an element of ARRAY[$CWD]
  - The first element will always be the parent of the $CWD
  - The second element will always be a string representing the current
    directory's size
  - Each subsequent element is a string representing the children of $CWD of the
    form:
    `type:<dir|file|root>;name:<name>;size:<size>`
    Where the "root" type is unique to the `/` directory

After the parsing, I should have an array indexed by directory name where each
element represents some relevant info about its contents

Now, I need to construct a function that will find the size of each directory's
contents.

My thought is something recursive that, if the "size" property isn't found, will
call the function on the key (of the main/big/outermost array) and return that
as a size value.

### Extra thoughts

I might change the representation of the filesystem as a list of list of lists
instead, whatever that means. It might make it easier to parse things since it
won't involve some awkward "awk"ing to split up the type, name, and size fields,
and further "awk"ing to read the values of these fields
