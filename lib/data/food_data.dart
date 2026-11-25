import '../models/food.dart';

const categories = ['All', 'Burgers', 'Pizza', 'Asian', 'Healthy', 'Desserts'];

const foods = <Food>[
  Food(id: 'f1', name: 'Classic Beef Burger', restaurant: 'Burger House', category: 'Burgers',
    description: 'Juicy grilled beef patty with cheddar, crisp lettuce, tomato and our signature house sauce in a toasted brioche bun.',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=900', price: 850, rating: 4.8, deliveryMinutes: 25, isPopular: true),
  Food(id: 'f2', name: 'Margherita Pizza', restaurant: 'Napoli Kitchen', category: 'Pizza',
    description: 'Stone-baked pizza topped with fresh mozzarella, basil and rich tomato sauce.',
    imageUrl: 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=900', price: 1250, rating: 4.7, deliveryMinutes: 30),
  Food(id: 'f3', name: 'Crispy Chicken Burger', restaurant: 'Burger House', category: 'Burgers',
    description: 'Golden crispy chicken, creamy mayo, crunchy slaw and pickles.',
    imageUrl: 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=900', price: 790, rating: 4.6, deliveryMinutes: 22, isPopular: true),
  Food(id: 'f4', name: 'Salmon Poke Bowl', restaurant: 'Green Spoon', category: 'Healthy',
    description: 'A fresh bowl with salmon, avocado, cucumber, edamame and sesame rice.',
    imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=900', price: 1450, rating: 4.9, deliveryMinutes: 35),
  Food(id: 'f5', name: 'Creamy Alfredo Pasta', restaurant: 'Pasta Point', category: 'Asian',
    description: 'Silky parmesan cream sauce, fettuccine and a touch of cracked black pepper.',
    imageUrl: 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=900', price: 1100, rating: 4.7, deliveryMinutes: 28),
  Food(id: 'f6', name: 'Chocolate Lava Cake', restaurant: 'Sweet Treats', category: 'Desserts',
    description: 'Warm chocolate cake with a molten centre, served with vanilla ice cream.',
    imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=900', price: 550, rating: 4.9, deliveryMinutes: 20),
  Food(id: 'f7', name: 'Pepperoni Pizza', restaurant: 'Napoli Kitchen', category: 'Pizza',
    description: 'A crowd favourite with mozzarella, pepperoni and oregano on a crisp crust.',
    imageUrl: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=900', price: 1550, rating: 4.8, deliveryMinutes: 32),
  Food(id: 'f8', name: 'Chicken Chow Mein', restaurant: 'Wok Express', category: 'Asian',
    description: 'Wok-tossed noodles with tender chicken, vegetables and savoury sauce.',
    imageUrl: 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=900', price: 950, rating: 4.5, deliveryMinutes: 26),
];
