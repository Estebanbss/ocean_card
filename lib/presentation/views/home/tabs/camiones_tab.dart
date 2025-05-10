import 'package:flutter/material.dart';

class CamionesTab extends StatelessWidget {
  const CamionesTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el esquema de colores del tema actual
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tarjeta principal para información de camiones
          Card(
            color: colorScheme.surface, // Color de superficie para la tarjeta
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título de la sección con color primario
                  Text(
                    'Camiones',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme
                          .primary, // Usar color primario para títulos
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Contenido de camiones
                  Text(
                    'Contenido de camiones...',
                    style: TextStyle(
                      color: colorScheme.onSurface,
                    ), // Color de texto sobre superficie
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
