defmodule Hw07Web.JobView do
  use Hw07Web, :view
  alias Hw07Web.JobView

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      jobid: job.jobid,
      desc: job.desc,
      name: job.name,
      budget: job.budget}
  end
end
