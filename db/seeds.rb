require_relative('../models/owner.rb')
require_relative('../models/beast.rb')
require_relative('../models/adoption')
require('pry')

Adoption.delete_all()
Owner.delete_all()
Beast.delete_all()

def createNewOwner(first_name, last_name, location)
  owner = Owner.new('first_name' => first_name, 'last_name' => last_name, 'location' => location)
  owner.save
  return owner
end

owner1 = createNewOwner('Queenie', 'Goldstein', 'New York')
owner2 = createNewOwner('Porpentina', 'Goldstein', 'New York')
owner3 = createNewOwner('Albus', 'Dumbledore', 'Hogwarts')
owner4 = createNewOwner('Rubeus', 'Hagrid', 'Hogwarts')
owner5 = createNewOwner('Bathilda', 'Bagshot', "Godric's Hollow")


def createNewBeast(name, type, collection_date, adoption_status, characteristics, diet, image)
  beast = Beast.new('name' => name, 'type' => type, 'collection_date' => collection_date, 'adoption_status' => adoption_status, 'characteristics' => characteristics, 'diet' => diet, 'image' => image)
  beast.save
  return beast
end

beast1 = createNewBeast('Pickett', 'bowtruckle', '1925-04-11', 'not adoptable', 'peaceful and shy, but will attack if their tree is threatened', 'woodlice or insects', "bowtruckle.png")

beast2 = createNewBeast('Sickleworth', 'niffler', '1926-07-24', 'adoptable', 'affectionate but destructive NOT A HOUSE PET', 'matellic objects', "niffler.jpeg")

beast3 = createNewBeast('Fawkes', 'pheonix', '1920-04-09', 'adoptable', 'hard to domesticate, regenerates by bursting into flames and rising from the ashes, healing tears', 'herbs', "pheonix.jpeg")

beast4 = createNewBeast('Shadow', 'thestral', '1921-10-22', 'adoptable', 'highly intelligent, has an excellent sense of direction, can only be seen by those who have seen death', 'meat', "thestral.jpeg")

beast5 = createNewBeast('Oracle', 'demiguise', '1923-01-30', 'adoptable', 'peaceful, can make himself invisible', 'hervivore', "demiguise.png")

beast6 = createNewBeast('Lulu', 'erumpent', '1919-05-01', 'not adoptable', "won't attack unless provoked, horn is explosive NOT FOR DOMESTIC ADOPTION", 'herbivore', "erumpent.jpeg")

beast7 = createNewBeast('Jasmine', 'occamy', '1925-09-21', 'adoptable', "can grow or shrink to fill the space they are in, highly protective of their eggs", 'rats and birds', "occamy.jpeg")

beast8 = createNewBeast('Frank', 'thunderbird', '1926-07-21', 'adoptable', "can create storms and senses supernatural danger", 'ferrets', "thunderbird.jpeg")

beast9 = createNewBeast('Twig', 'bowtruckle', '1925-02-13', 'adoptable', 'peaceful and shy, but will attack if their tree is threatened', 'woodlice or insects', "bowtruckle.png")

beast10 = createNewBeast('Nyalls', 'thestral', '1915-11-01', 'not adoptable', 'highly intelligent, has an excellent sense of direction, can only be seen by those who have seen death', 'meat, NO SUGAR', "thestral.jpeg")

def createNewAdoption(adoption_date, update_message, owner_id, beast_id)
  adoption = Adoption.new('adoption_date' => adoption_date, 'update_message' => update_message, 'owner_id' => owner_id, 'beast_id' => beast_id)
  adoption.save
  return adoption
end

adoption1 = createNewAdoption('1923-02-15', 'Fawkes has settled into his new home easily, he is very loyal and we have created a strong bond', owner3.id, beast3.id)

adoption2 = createNewAdoption('1926-09-29', "Sickleworth has been a great addition to my life. Of course, I do not keep him in my house, but I have made a suitable habitat for him out in my garden, filled with shiny objects to keep him happy", owner1.id, beast2.id)

binding.pry
nil
