class TransactionsController < ApplicationController
  def create

    respond_to do |format|
      format.json do
        if params[:trans].present? and params[:confs].present?
          trans = JSON.parse(params[:trans])
          confs = JSON.parse(params[:confs])
          trans = Apriori.find_association_rules(trans,
                            :min_items => confs[0],
                            :max_items => confs[1],
                            :min_support => confs[2], 
                            :max_support => confs[3], 
                            :min_confidence => confs[4]).join("\n").split("\n")

          render :json => trans.to_json
        else
          render :json => {:error => "Parameters required"}.to_json
        end
      end
    end
  end

  def dm(trans, confs)
    transactions = trans
    rules = Apriori.find_association_rules(transactions)#, :min_items => 2, :max_items => 5, :min_support => 1, :max_support => 100, :min_confidence => 20)
  end
end
