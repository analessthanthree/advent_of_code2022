# NOTES FOR PUZZLE 1

Arranging the moves played in a "times table" like so reveals an interesting
pattern. It screams of group theory, modular arithmetic, blah blah blah

```
  x y z
a 3 6 0
b 0 3 6
c 6 0 3
```

I'm not smart enough to know what group this is *supposed* to be, but the rules
of the elf tourney are that playing x gives you 1 points, y gives you 2 points,
and u gives you 3 points. So let's just assign these values to x, y, and z.

```
x=1
y=2
z=3
```

Now what we want to do is come up with some operation that maps the pairs as
such:

```
(a,x) -> 3
(a,y) -> 6
(a,z) -> 0
(b,x) -> 0
(b,y) -> 3
(b,z) -> 6
(c,x) -> 6
(c,y) -> 0
(c,z) -> 3
```

It turns out, that if you let:

```
a=0
b=6
c=12
```

Then the following formula gives you the correct results:

```
P = 3*X+A % 9
```

Where `P` is the number of points earned from the interation, `X` in `{x,y,z}`,
`A` in `{a,b,c}`, and finally `% 9` denotes modulo (remainder after dividing by)
`9`.  In bash, all we have to do now is filter each input row to map the letters
to the appropriate number, pipe each row through the formula, and add up all the
scores granted for win/loss/draw. Finally, we must add the "base" values for the
hand you played.

# NOTES FOR PUZZLE 2

It turns out we made a bad assumption as to what the helpful elf was trying to
tell us. We weren't being told what hand needed to be played to win, we were
being told whether we should win, lose, or draw.

In puzzle 1, we were given hands to play ("base" score) and had to find out the
score of the round results. Now, we know that we were given the score of the
round results, and need to figure out the base score. Our "times table" is thus:

```
  x  y  z
a 3  1  2
b 1  2  3
c 2  3  1
```

Now what we want to do is come up with some operation that maps the pairs as
such:

```
(a,x) -> 3
(a,y) -> 1
(a,z) -> 2
(b,x) -> 1
(b,y) -> 2
(b,z) -> 3
(c,x) -> 2
(c,y) -> 3
(c,z) -> 1
```

Letting `x,y,z` once again take on the value of the score that we *know* we're
going to get:

```
x=0
y=3
z=6
```

And so:

```
a=3
b=1
c=2
```

P=X/3+A % 3 ????? sort of works but you can't really get a score of 3 with a mod
3...

So, whenever we get a `0`, we'll just change it to `3` using sed.
