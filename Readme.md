# Buildkite Rails Parallel Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example on how to easily run 20 parallel testing agents for a [Rails](https://rubyonrails.org/) application using [Buildkite](https://buildkite.com/), [rbenv](https://github.com/rbenv/rbenv) and [Knapsack](https://github.com/ArturT/knapsack).

## How does it work?

The parallelism field for the rspec step in the [pipeline configuration](.buildkite/pipeline.yml) is set to 20, which will create 20 jobs for each build, allowing you to start 20 agents and distribute the work.

```yml
steps:
  - name: ":rspec: %n"
    command: "scripts/ci/setup.sh && scripts/ci/parallel_specs.sh"
    parallelism: 20
```

See the [parallelizing builds guide](https://buildkite.com/docs/guides/parallelizing-builds) for more information to create parallelized and distributed builds with Buildkite.

[.buildkite/hooks/environment](.buildkite/hooks/environment) sets up rbenv correctly; [scripts/ci/setup.sh](scripts/ci/setup.sh) sets up the DB; gem and npm dependencies; and [scripts/ci/parallel_specs.sh](scripts/ci/parallel_specs.sh) calls the Knapsack rake task to run the specs in parallel.

## License

See [Licence.md](Licence.md) (MIT)
