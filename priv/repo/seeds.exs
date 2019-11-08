# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hw07.Repo.insert!(%Hw07.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hw07.Repo
alias Hw07.Users.User
alias Hw07.Jobs.Job
alias Hw07.Timesheets.Timesheet

pw = Argon2.hash_pwd_salt("password12345")


alice = Repo.insert!(%User{name: "Alice", email: "alice@example.com", password_hash: pw, ismanager: true})
bob = Repo.insert!(%User{name: "Bob", email: "bob@example.com", password_hash: pw, ismanager: false, managerid: alice.id})

Repo.insert!(%Job{jobid: "VAOR-01", budget: 20, desc: "Cyborg Arm", name: "Cyborg Arm"})
Repo.insert!(%Job{jobid: "VAOR-02", budget: 45, desc: "Sobriety Pill", name: "Sobriety Pill"})
Repo.insert!(%Job{jobid: "VAOR-03", budget: 12, desc: "Rat Cancer", name: "Rat Cancer"})


