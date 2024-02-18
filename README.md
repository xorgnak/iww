
## Installation

Install the gem and add to the application's Gemfile by executing:

    `bundle add iww`

If bundler is not being used to manage dependencies, install the gem by executing:

    `gem install iww`

## Usage
First, require the library:
```
require 'iww'
```


### Preample
The I.W.W. Constitution preamble.
```
Iww.preamble
```

### Join Link
A helpful link to become a member.
```
Iww.join!
```

### Images
The red and white logos, and the seal.
```
Iww.image
```
### Jobs
A list of represented jobs and industries.
```
Iww.jobs
```

### Search
Find the appropriate division based upon search.
```
##
# search object
Iww[123]            # Search by division number.
Iww["123"]          # Search by division number from a string.
Iww[:job]    # Search by job as symbol.
Iww["division"]       # Search by division as string.

...

##
# returns a hash with key of the divison number as a string and the division description also as a string.
{ "123" => "Division" }
```

## Interactive
You can also run `ruby bin/console` for an interactive prompt that will allow you to experiment.

