# knot testbed

A simple docker based knot testbed.

*This is not intended to be used in a production setup.*

## Usage

Just run `make` to build and run the testbed on your computer.

After that you can send queries to the server like this:

`$ dig SOA example.com @127.0.0.1 -p 8053`

By default the files from the `./config/` directory are mounted into the docker container.
Zonefiles reside in the `./config/zonefiles/` directory.

If you want to make changes to the config (`./config/knot.conf`) or any of the zones just edit the files in your working directory and then save it.

The scripts `./scripts/watch-nsd-config` and `./scripts/watch-zonefiles` are used to watch for modifications on the respective files.
They use the `knotc conf-check` and `knotc zone-check` binaries to make sure that your changes are valid.
