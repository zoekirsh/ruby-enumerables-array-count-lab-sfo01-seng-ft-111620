# Array Count Lab

## Introduction

One of the most commonly used Enumerables happens to be one you might have
already seen - `count`.

When dealing with `Array`s, we can use `count` to find the total number of
elements in the array.

```rb
[1, 2, 3].count # => 3
```

You may have noticed in some previous examples, instead of `count`, we might
have used `length`.

```rb
[1, 2, 3].length # => 3
```

In fact, there is a third alias, `size`, that also works:

```rb
[1, 2, 3].size # => 3
```

For this sort of task - "reducing" an **entire** array of data down to a single
value - the three terms are interchangeable.

However, `count` has additional functionality that `length` and `size` do not
have. [`count` is an _Enumerable_][count].

In this lesson, we're going to take a more in-depth look at `count`, why it is
different than `length` and `size`, and how it is useful. At the end, you will
be tasked with writing your own 

## `count` vs `length` and `size`

`length` and `size` are both built-in methods for `Array`s that serve a single
task - get the **pre-computed** total number of elements in a given array. That
is all they do (though we've seen working with `while` loops that this alone can
be pretty useful). `Array`s always keep track of their size, and these methods
access that information.

As we mentioned, `count` is an Enumerable. Enumerables are _available_ to all
`Array`s, but operate a bit differently - they always _enumerate_; they move
over elements in a collection one by one. `count` doesn't just ask an `Array` for
information it already knows. It _counts_ every element.

Because `count` goes through the work of enumerating over each element, we have
some additional control over _how_ it counts. We can do this by passing a
block to `count`.

```rb
[1, 2, 3,].count do |element|
  # code in here runs every time count enumerates over an element
  # that element is available as the name we define inside the pipes above
end
```

A **block** in Ruby refers to code inside `do...end` or curly braces `{}`. We've
seen them before with `while` loops. The code stored inside will run every time
the block is called. In this case, the code will run for every element in the
array `count` is called from. We can access the current element as whatever name
we define inside the pipes after `do`. In this case, we used `element`, but we
could choose whatever name we'd like.

In the block, we include code that will determine whether or not to count the
current element. For instance, in an array of integers, maybe we only want to
count elements that are _even_:

```rb
[1, 2, 3, 4].count do |element|
  element.even?
end
```

`count` will count **every time the block returns a truthy value**. In the case
above, `count` is checking if each element is even, going through the array
elements like so:

```rb
1.even? # => false
2.even? # => true
3.even? # => false
4.even? # => true
```

Since two expressions evaluate to `true`, `count` returns `2` as
the result.

## Haven't We Seen This Before?

If you recall, we implemented code for counting even values in an earlier
lesson. Back then, we used `while` loops and wrote something similar to the
following:

```rb
total = 0
array = [1, 2, 3, 4]
index = 0

while index < array.length do
  if array[index].even?
    total += 1 # total is only incremented when the current array element is even
  end
  index += 1
end
total
```

`count` provides a streamlined way to accomplish this task. Let's consider
another example. Imagine we had an array of numbers, and we only wanted to count
those that are _positive_.

```rb
array = [0, 1, -9, 24, 5, -10]
```

Using a `while` loop, we could modify the conditional statement to check if each
element is greater than zero.

```rb
...
if array[index] > 0
  total += 1 # only increments when teh current element is greater than zero
end
...
```

Using `count` and a block, we do the same:

```rb
array.count do |num|
  num > 0
end
 # => 3
```

If we wanted to use the curly brace syntax instead:

```rb
array.count { |num| num > 0 }
  # => 3
```

Both forms are valid, though Rubyists tend to use `do..end` for readability if
there are multiple lines of code in the block.

## Instructions

It's time to practice what we've learned. For this lab, your task is to
implement two methods using `count`. Complete your work in `lib/array_count.rb`
and run `learn` to check your code.

### `count_strings`

The `count_strings` method takes in an array of different data types, enumerates
over them and returns the total number of `String`s present in the array. For
example, if we had the following array:

```rb
array = [1, "hello", [], 5.01, "world", :name, { a: 1 }]
```

Passed into `count_strings`, we should get `2` in return.

```rb
count_strings(array)
 # => 2
```

### `count_empty_strings`

The `count_empty_strings` method is a slight variation on the last method - it
takes in an array of different data types and returns the total number of
_empty_ `String`s present. For example, if we had the
following array:

```rb
array = [ "", "Hello", 4, [], "", "" ]
```

Passed into `count_empty_strings`, we should get `3` in return.

```rb
count_empty_strings(array)
 # => 3
```

## Conclusion

The `count` Enumerable is handy way to count things in a specific way. Unlike
the `length` and `size` array methods, `count` enumerates over every element in
a collection. Because it enumerates, we can use a block to customize
what `count` considers worthy of counting.

We will soon see that all the Enumerables we learn about will use a block this
way. They all have the ability to step through a collection. At every step, they
_yield_ some control to us via a block.

## Resources

- [Ruby Documentation on `count` Enumerable][count]

[count]: https://ruby-doc.org/core-2.7.0/Enumerable.html#method-i-count
