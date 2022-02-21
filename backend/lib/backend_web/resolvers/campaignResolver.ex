defmodule BackendWeb.Resolvers.CampaignResolver do
  alias Backend.Store

  def list_campaigns(_parent, _args, _resolution) do
    {:ok, Store.list_campaigns()}
  end
end
