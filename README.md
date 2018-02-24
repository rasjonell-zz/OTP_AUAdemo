# Introduction to OTP in Elixir

## Demo Project from the "Tech Talks" event at AUA

There are two main applications: ```aua_demo``` and ```factorial```.

The first is a ```Phoenix``` web applciation that in order to calculate factorial of a given number, send a message to ```Factorial``` module.

The router(```aua_demo/lib/router.ex```) receives the calculated number from ```Factorial``` and displays the message.

## Starting The Apps

1. Start the web app(type the command in ```aua_demo/``` directory)

```elixir
iex --sname aua@localhost -S mix phx.server 
```

Now the web service is available at ```localhost:4000```

2. Start the factorial app(type the command in ```factorial/``` directory)

```elixir
iex --sname factorial@localhost -S mix
```

## Debugging

To debug applications use ```observer``` library from Erlang

```elixir
:observer.start
```

## Concurrency 

The requests are concurrent and asynchronous. The response time of a single request won't have any effect on others.
