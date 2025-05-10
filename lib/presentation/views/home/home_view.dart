import 'package:flutter/material.dart';
import 'tabs/reservas_tab.dart';
import 'tabs/planificacion_tab.dart';
import 'tabs/camiones_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _controladorTab;
  // Títulos de las pestañas
  final List<String> _titulosPestanas = [
    'Reservas',
    'Planificación',
    'Camiones',
  ];
  // Títulos de los encabezados
  final List<String> _titulosEncabezados = [
    'RESUMEN RESERVAS',
    'PLANIFICACIÓN DE CAMIONES',
    'RESUMEN CAMIONES EN ESPERA',
  ];

  @override
  void initState() {
    super.initState();
    _controladorTab = TabController(length: 3, vsync: this);
    _controladorTab.addListener(_manejarCambioDeTab);
  }

  @override
  void dispose() {
    _controladorTab.dispose();
    super.dispose();
  }

  /// Maneja los cambios entre pestañas y actualiza el estado
  void _manejarCambioDeTab() {
    if (_controladorTab.indexIsChanging) {
      setState(() {});
    }
  }

  /// Obtiene el subtítulo actual basado en la pestaña seleccionada
  String get subtituloActual =>
      'Inicio / ${_titulosPestanas[_controladorTab.index]}';

  /// Obtiene el título actual basado en la pestaña seleccionada
  String get tituloActual => _titulosEncabezados[_controladorTab.index];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección de encabezado con título y subtítulo
              Container(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                color: colorScheme.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtítulo (ruta de navegación)
                    Text(
                      subtituloActual,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),

                    // Título principal en negrita con color primario
                    Text(
                      tituloActual,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              // Barra de pestañas con iconos
              TabBar(
                controller: _controladorTab,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurface.withValues(
                  alpha: 0.7,
                ),
                indicatorColor: colorScheme.primary,
                tabs: const [
                  Tab(icon: Icon(Icons.event_available), text: 'Reservas'),
                  Tab(icon: Icon(Icons.calendar_month), text: 'Planificación'),
                  Tab(icon: Icon(Icons.local_shipping), text: 'Camiones'),
                ],
              ),

              // Contenido de las pestañas
              Expanded(
                child: Container(
                  color: colorScheme.surface,
                  child: TabBarView(
                    controller: _controladorTab,
                    children: const [
                      ReservasTab(),
                      PlanificacionTab(),
                      CamionesTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
