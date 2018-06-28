# Haskell CI/CD template

This is a family of templates for quickly getting started with CI/CD on popular build services like TravisCI. I'll be adding more stuff as I go. Everything will initially be based on things I've used for [Bloodhound](), [Esqueleto](), and for client work.

Feel free to PR support for more services, just try to ensure the new template/example build matches the design of the others in the repository.

# What CI should I use?

If you aren't sure what you should use:

- Open source projects trying to keep it simple should use TravisCI which has became a de-facto standard.

- For proprietary projects or more involved open source projects I heartily recommend GitLab CI. You don't have to use GitLab for your source control to make use of it.

# Supported services

- [TravisCI](.travis.yml)

- [GitLab CI](.gitlab-ci.yml)

# Services I'd like to add support for


- CircleCI

- Drone (this is kinda derelict but some people might still be on it)
