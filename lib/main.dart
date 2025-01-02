import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';
import 'models/pokemon.dart';
import 'providers/phone_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        ChangeNotifierProvider(create: (_) => PhoneProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter API Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFF8983E),
            onPrimary: Colors.white,
            secondary: Color(0xFFE55053),
            onSecondary: Colors.white,
            surface: Color(0xFF282B27),
            onSurface: Colors.white,
            error: Color(0xFF9C2FB2),
            onError: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFF282B27),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white70),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showPokemon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showPokemon ? 'Pokémon API' : 'Phone Validator'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(
              showPokemon ? Icons.phone : Icons.catching_pokemon,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              setState(() {
                showPokemon = !showPokemon;
              });
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: showPokemon
            ? const PokemonListScreen()
            : const PhoneValidatorScreen(),
      ),
    );
  }
}

class PhoneValidatorScreen extends StatelessWidget {
  const PhoneValidatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Validar Número Telefónico',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: phoneController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Número telefónico',
              labelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              prefixIcon: Icon(Icons.phone,
                  color: Theme.of(context).colorScheme.primary),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.check),
            label: const Text('Validar'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              final phone = phoneController.text.trim();
              if (phone.isNotEmpty) {
                Provider.of<PhoneProvider>(context, listen: false)
                    .validatePhone(phone);
              }
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<PhoneProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.phoneValidation == null) {
                  return const Center(
                    child: Text(
                      'Ingresa un número para validar.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }

                final validation = provider.phoneValidation!;
                return Card(
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Número: ${validation.number}'),
                        Text('Válido: ${validation.valid ? "Sí" : "No"}'),
                        Text('País: ${validation.countryName}'),
                        Text('Ubicación: ${validation.location}'),
                        Text('Operador: ${validation.carrier}'),
                        Text('Tipo de línea: ${validation.lineType}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Buscar Pokémon',
              labelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              prefixIcon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.primary),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.search),
          label: const Text('Buscar'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            final name = searchController.text.trim().toLowerCase();
            if (name.isNotEmpty) {
              Provider.of<PokemonProvider>(context, listen: false)
                  .fetchPokemon(name);
            }
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Consumer<PokemonProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (provider.pokemon == null) {
                return const Center(
                  child: Text(
                    'Busca un Pokémon para mostrar sus detalles.',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              }

              final Pokemon pokemon = provider.pokemon!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        pokemon.sprites.frontDefault,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      pokemon.name.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text('Altura: ${pokemon.height / 10} m',
                        style: const TextStyle(color: Colors.white70)),
                    Text('Peso: ${pokemon.weight / 10} kg',
                        style: const TextStyle(color: Colors.white70)),
                    Text('Tipos: ${pokemon.types.join(", ")}',
                        style: const TextStyle(color: Colors.white70)),
                    Text('Habilidades: ${pokemon.abilities.join(", ")}',
                        style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
