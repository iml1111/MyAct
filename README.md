# MyAct
Boilerplate for light-weight Actix web Backend Structure (Edited 2023-04-10)

This is a boilerplate build web application servers using the Actix Web framework.

I look forward to your feedback.

## Environment variables
since default values are defined for all environment variables, it can be executed immediately. The values below are default values.
```shell
# .env (default)
APP_NAME=MyAct
WORKER_NUM=1
CONTACT_URL=https://github.com/iml1111
SLOW_API_TIME=0.5
```

## Get Started
```shell
$ git clone https://github.com/iml1111/MyAct
$ cd MyAct/
$ cargo test
    Finished test [unoptimized + debuginfo] target(s)
     Running unittests src/main.rs 

running 3 tests
test tests::sample::tests::test_true ... ok
test tests::sample::tests::test_index ... ok
test tests::sample::tests::test_get_champion ... ok

test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out;

$ cargo run
...
cargo run
   Compiling myact v0.1.0 (~/MyAct)
    Finished dev [unoptimized + debuginfo] target(s) in 59.36s
     Running `target/debug/myact`
[2023-04-09T12:44:21Z INFO  actix_server::builder] starting 1 workers
[2023-04-09T12:44:21Z INFO  actix_server::server] Actix runtime found; starting in Actix runtime
[2023-04-09T12:44:21Z INFO  myact] Constructing the App:MyAct
```

### Docker Build
```shell
$ docker build -t myact .
$ docker run -name myact -p 8080:8080 myact
```

![image](https://user-images.githubusercontent.com/29897277/230773250-7d5819ef-12a3-4de1-9bd3-301032dfdc19.png)


## Structure
```
MyAct
├── Cargo.lock
├── Cargo.toml
└── src
    ├── main.rs
    ├── config.rs
    ├── app
    │   ├── error_handler.rs
    │   ├── mod.rs
    │   ├── response.rs
    │   └── router
    │       ├── mod.rs
    │       ├── template.rs
    │       └── v1
    │           ├── mod.rs
    │           └── sample.rs
    ├── controller
    │   ├── calc.rs
    │   └── mod.rs
    ├── model
    │   ├── mod.rs
    │   └── repository
    │       ├── champion.rs
    │       └── mod.rs
    └── tests
        ├── mod.rs
        └── sample.rs
```
### main.rs
main module of MyAct. It manages the objects created by the application factory.

### config.rs
Appropriate config objects are created and managed via environment variables.

### app
This is where you write code related to Actix. Required resources are placed in the appropriate space according to the rules followed by Actix.
### controller
This means an independent module that does not depend on Actix.

### model
It manages various types of data models used in applications including DTO and ORM.
- model/repository: A set of Struct models to control Actix body data
### tests
It is a test module package written based on unittest.