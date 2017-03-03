class CreditCard < ActiveRecord::Base
  belongs_to(:owner)
end




# WITH card_limit_tot AS(
#   SELECT owner_id, card_limit
#   FROM credit_cards
#   WHERE owner_id = 5)
#   SELECT
#     SUM(card_limit) AS tot_card
#   FROM card_limit_tot;
