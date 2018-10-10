require_relative('../models/owner.rb')
require_relative('../models/beast.rb')
require_relative('../models/adoption')
require('pry')

Adoption.delete_all()
Owner.delete_all()
Beast.delete_all()


owner1 = Owner.new({'first_name' => 'Queenie', 'last_name' => 'Goldstein', 'location' => 'New York'})
owner2 = Owner.new({'first_name' => 'Porpentina', 'last_name' => 'Goldstein', 'location' => 'New York'})
owner3 = Owner.new({'first_name' => 'Albus', 'last_name' => 'Dumbledore', 'location' => "Hogwarts"})
owner4 = Owner.new({'first_name' => 'Rubeus', 'last_name' => 'Hagrid', 'location' => "Hogwarts"})
owner5 = Owner.new({'first_name' => 'Bathilda', 'last_name' => 'Bagshot', 'location' => "Godric's Hollow"})

owner1.save
owner2.save
owner3.save
owner5.save

beast1 = Beast.new({'name' => 'Pickett', 'type' => 'bowtruckle', 'collection_date' => '1925-04-11', 'adoption_status' => 'not adoptable', 'characteristics' => 'peaceful and shy, but will attack if their tree is threatened', 'diet' => 'woodlice or insects' })
beast2 = Beast.new({'name' => 'Sickleworth', 'type' => 'niffler', 'collection_date' => '1926-07-24', 'adoption_status' => 'adoptable', 'characteristics' => 'affectionate but destructive NOT A HOUSE PET', 'diet' => 'matellic objects' })
beast3 = Beast.new({'name' => 'Fawkes', 'type' => 'pheonix', 'collection_date' => '1920-04-09', 'adoption_status' => 'adoptable', 'characteristics' => 'hard to domesticate, regenerates by bursting into flames and rising from the ashes, healing tears', 'diet' => 'herbs'})
beast4 = Beast.new({'name' => 'Shadow', 'type' => 'Thestral', 'collection_date' => '1921-10-22', 'adoption_status' => 'adoptable', 'characteristics' => 'highly intelligent, has an excellent sense of direction, can only be seen by those who have seen death', 'diet' => 'meat'})
beast5 = Beast.new({'name' => 'Oracle', 'type' => 'Demiguise', 'collection_date' => '1923-01-30', 'adoption_status' => 'adoptable', 'characteristics' => 'peaceful, can make himself invisible', 'diet' => 'hervivore'})
beast6 = Beast.new({'name' => 'Lulu', 'type' => 'Erumpent', 'collection_date' => '1919-05-01', 'adoption_status' => 'not adoptable', 'characteristics' => "won't attack unless provoked, horn is explosive NOT FOR DOMESTIC ADOPTION", 'diet' => 'herbivore'})
beast7 = Beast.new({'name' => 'Jasmine', 'type' => 'Occamy', 'collection_date' => '1925-09-21', 'adoption_status' => 'adoptable', 'characteristics' => "can grow or shrink to fill the space they are in, highly protective of their eggs", 'diet' => 'rats and birds'})
beast8 = Beast.new({'name' => 'Frank', 'type' => 'Thunderbird', 'collection_date' => '1926-07-21', 'adoption_status' => 'adoptable', 'characteristics' => "can create storms and senses supernatural danger", 'diet' => 'ferrets'})

beast1.save
beast2.save
beast3.save
beast4.save
beast5.save
beast6.save
beast7.save
beast8.save

adoption1 = Adoption.new({'adoption_date' => '1923-02-15', 'update_message' => 'Fawkes has settled into his new home easily, he is very loyal and we have created a strong bond', 'owner_id' => owner3.id, 'beast_id' => beast3.id})

adoption2 = Adoption.new({'adoption_date' => '1926-09-29', 'update_message' => "Sickleworth has been a great addition to my life. Of course, I do not keep him in my house, but I have made a suitable habitat for him out in my garden, filled with shiny objects to keep him happy", 'owner_id' => owner1.id, 'beast_id' => beast2.id})

adoption1.save
adoption2.save

binding.pry
nil
