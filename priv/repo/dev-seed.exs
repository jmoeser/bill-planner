defmodule BillPlanner.Repo.DevEnvSeed do

  def seed do

    {:ok, _user} = BillPlanner.Accounts.register_user(%{email: "test@test.test", password: "Password01!!"})

    {:ok, type} = BillPlanner.Bills.create_type(%{type: "Electricity"})

    {:ok, provider} = BillPlanner.Bills.create_provider(%{name: "Company A"})

    {:ok, bill} = BillPlanner.Bills.create_bill(%{type_id: type.id,
                                                provider_id: provider.id,
                                                start_date: Date.utc_today(),
                                                recurrence_in_days: 30})
    BillPlanner.Bills.create_paid_bill(%{amount: "10.01", paid_date: Date.utc_today(), bill_id: bill.id})

  end
end

BillPlanner.Repo.DevEnvSeed.seed()
