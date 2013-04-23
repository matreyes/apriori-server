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
end

#a = [["a", "b"], ["c", "d"]].to_json
#c = [2,5,1,100,20].to_json

#r = RestClient.post url, :trans => a, :confs => c
#JSON.parse(r)

#a -> b (50.0/1, 100.0)
#b -> a (50.0/1, 100.0)
#c -> d (50.0/1, 100.0)
#d -> c (50.0/1, 100.0)
