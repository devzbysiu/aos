<div align="center">

  <h1><code>Always On Stats</code></h1>

  <h3>
    <strong>Live code statistics widget</strong>
  </h3>

  <p>
    <img src="https://img.shields.io/crates/l/je?style=for-the-badge" alt="License"/>
  </p>

  <h3>
    <a href="#about">About</a>
    <span> | </span>
    <a href="#installation">Installation</a>
    <span> | </span>
    <a href="#configuration">Configuration</a>
    <span> | </span>
    <a href="#license">License</a>
    <span> | </span>
    <a href="#contribution">Contribution</a>
  </h3>

<sub><h4>Built with 🦀</h4></sub>

</div>

# <p id="about">About</p>

AOS purpose is to show live code statistics without cognitive break. Whether you
are TDDing your software or refactoring well covered project, AOS allows keeping
your focus on the IDE and at the same time showing the status of the tests (see
the widget in the top right corner in the GIF below).

![AOS](res/aos.gif)

First, I'm opening text editor. In the top right corner you can see three
widgets. From the top:

- results of `cargo check`
- results of `cargo test`
- code coverage via `cargo tarpaulin`

The widgets start blinking which means that mentioned statistics are in pending
state. We can see all results are green. Code coverage has different color based
on the level of the coverage.

Next, I'm breaking the code. We can see that the first widget starts blinking,
then turns red and blinks in red. This means that the `cargo check` failed. Next
stage is not started until the previous one is successful, so second widget does
not change.

Next, I'm fixing the code, but I'm changing the assertion, so the tests will
fail. First widget starts blinking, then changes green as the code syntax is
correct. Second widget starts blinking which means the tests are running. Next,
it changes to red which means the tests failed. Code coverage is not starting at
this point.

Finally, I'm fixing the test. First widget changes to green, second widget
starts blinking and changes to green - tests passed. Last widget does not change
because no tests were changed (in terms of names of the tests).

Then I'm changing the test name. Again, first two widgets change finishing as
green. Next `chester` finds out that the tests set changed, so the last widget
starts blinking. It takes the longest because code coverage is computationally
most intensive out of those three statistics. At the end, the widget changes
color based on the level of the coverage.

AOS is built upon [chester](https://github.com/devzbysiu/chester). Chester
listens for changes in your project and runs various code tool. It also exposes
API which is consumed by AOS.

Currently, supported statistics are:

- `cargo check` result
- `cargo test` result
- code coverage via `cargo tarpaulin`

The widget is created with awesome [eww](https://github.com/elkowar/eww).

# <p id="installation">Installation</p>

1. Go [here](https://elkowar.github.io/eww/) to see how to install `eww`.

- Put `eww` binary somewhere in `PATH` to make it more convenient to work with.

2. Clone this repository.
3. Copy `eww.scss`, `eww.yuck` and `scripts` to `~/.config/eww/`
4. Check that it's working with `eww open aos` to open tests widget and
   `eww close aos` to close it.

If something is wrong you can use `eww logs` to see the logs.

# <p id="configuration">Configuration</p>

AOS does not require any configuration after you did all the steps described in
installation section above.

If you want to change the appearance, all the visual configuration should be
done in `eww.yuck` and `eww.scss`. Here are some useful resources:

- [main `eww` documentation](https://elkowar.github.io/eww/)
- [GTK CSS Overview](https://docs.gtk.org/gtk3/css-overview.html)

# <p id="license">License</p>

This project is licensed under either of

- Apache License, Version 2.0, (LICENSE-APACHE or
  http://www.apache.org/licenses/LICENSE-2.0)
- MIT license (LICENSE-MIT or http://opensource.org/licenses/MIT)

At your option.

# <p id="contribution">Contribution</p>

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
