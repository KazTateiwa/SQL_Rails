-- Using ActiveRecord in rails console, find the total credit extended to the owner with two credit cards

-- typed in Owner.find(5) to get the owner_id #5 to be able to get the sums of only owner #5's card limits.
 owner = Owner.find(5)
  SELECT  "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT 1  [["id", 5]]
 => #<Owner id: 5, address: "123 Main St.", first_name: "Kaz", last_name: "Tateiwa">

-- this calls owner_id5's credit card limits
 > owner.credit_cards
 SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."owner_id" = $1  [["owner_id", 5]]
 => #<ActiveRecord::Associations::CollectionProxy [#<CreditCard id: 4, card_number: #<BigDecimal:7fd7b5b00fd8,'0.5678E4',9(18)>, exp_date: "2020-09-09", owner_id: 5, card_limit: 100000>, #<CreditCard id: 5, card_number: #<BigDecimal:7fd7b5b00ab0,'0.9012E4',9(18)>, exp_date: "2020-09-09", owner_id: 5, card_limit: 200000>]>

-- this is used to find the sum of the two cards that belong to owner_id5
> owner.credit_cards.sum(:card_limit)
  SELECT SUM("credit_cards"."card_limit") FROM "credit_cards" WHERE "credit_cards"."owner_id" = $1  [["owner_id", 5]]
 => 300000
-------------------

-- reload! reloads your page when you have updated your database or tables
