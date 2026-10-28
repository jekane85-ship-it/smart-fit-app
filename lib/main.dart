import 'package:flutter/material.dart';
 
void main() {
 runApp(const FitCoachApp());
}
 
class FitCoachApp extends StatelessWidget {
 const FitCoachApp({super.key});
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'SmartFit Coach',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       brightness: Brightness.dark,
       scaffoldBackgroundColor: const Color(0xFF12141A),
       colorScheme: const ColorScheme.dark(
         primary: Color(0xFF00E676),
         secondary: Color(0xFF2979FF),
         surface: Color(0xFF1E222D),
       ),
       useMaterial3: true,
     ),
     home: const WorkoutGeneratorScreen(),
   );
 }
}
 
class Exercise {
 final String id;
 final String title;
 final String muscleGroup;
 final String locationType;
 final int minAge;
 final int maxAgeSafety;
 final String setsReps;
 final String weightRecommendationFormula;
 final List<String> criticalCheckpoints;
 final String animationUrl;
 
 Exercise({
   required this.id,
   required this.title,
   required this.muscleGroup,
   required this.locationType,
   this.minAge = 14,
   this.maxAgeSafety = 75,
   required this.setsReps,
   required this.weightRecommendationFormula,
   required this.criticalCheckpoints,
   required this.animationUrl,
 });
}
 
final List<Exercise> exerciseDatabase = [
 Exercise(
   id: 'pullups',
   title: 'Подтягивания широким хватом',
   muscleGroup: 'Спина',
   locationType: 'street',
   setsReps: '4 подхода по 6–10 повторений',
   weightRecommendationFormula: 'Собственный вес (или с резиной)',
   criticalCheckpoints: [
     'Тяга за счет сведения лопаток вниз, а не рывком бицепса',
     'Не раскачиваться и не задирать подбородок с изломом шеи',
     'В нижней точке не бросать плечевые суставы в пассивный вис',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1598971639058-fab3c3109a00?w=500',
 ),
 Exercise(
   id: 'dips',
   title: 'Отжимания на брусьях',
   muscleGroup: 'Грудь',
   locationType: 'street',
   setsReps: '3-4 подхода по 8–12 повторений',
   weightRecommendationFormula: 'Собственный вес',
   criticalCheckpoints: [
     'Локти не разводить слишком широко (угол около 45°)',
     'Наклон корпуса вперед смещает акцент на грудь, прямой корпус — на трицепс',
     'Опускаться строго до параллели плеча полу, глубже — риск для плеч',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?w=500',
 ),
 Exercise(
   id: 'bulgarian_squat',
   title: 'Болгарские выпады на лавке',
   muscleGroup: 'Ноги',
   locationType: 'street',
   setsReps: '3 подхода по 10–12 на ногу',
   weightRecommendationFormula: 'Собственный вес',
   criticalCheckpoints: [
     'Колено передней ноги строго сонаправлено со стопой, не валится внутрь',
     'Упор идет на пятку и середину стопы рабочей ноги',
     'Корпус держи слегка наклоненным вперед, спина ровная',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=500',
 ),
 Exercise(
   id: 'barbell_squat',
   title: 'Приседания со штангой',
   muscleGroup: 'Ноги',
   locationType: 'gym',
   minAge: 17,
   maxAgeSafety: 55,
   setsReps: '4 подхода по 8–10 повторений',
   weightRecommendationFormula: 'Пустой гриф (20 кг) или 50% веса тела',
   criticalCheckpoints: [
     'Колени строго разводятся в направлении носков, завал внутрь исключен!',
     'Пятки не отрываются от пола, упор на всю стопу',
     'Спина нейтральная, не округлять поясницу в нижней точке',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?w=500',
 ),
 Exercise(
   id: 'bench_press',
   title: 'Жим штанги лежа',
   muscleGroup: 'Грудь',
   locationType: 'gym',
   setsReps: '4 подхода по 8–10 повторений',
   weightRecommendationFormula: 'Начальный вес ~ 50-60% от веса тела',
   criticalCheckpoints: [
     'Лопатки сведены и жестко прижаты к скамье на протяжении подхода',
     'Угол между плечом и корпусом около 60–75 градусов',
     'Траектория опускания: к нижней части грудных мышц',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?w=500',
 ),
 Exercise(
   id: 'lat_pulldown',
   title: 'Тяга верхнего блока к груди',
   muscleGroup: 'Спина',
   locationType: 'gym',
   setsReps: '3-4 подхода по 10–12 повторений',
   weightRecommendationFormula: 'Около 40% веса тела для старта',
   criticalCheckpoints: [
     'Тяни рукоять локтями вниз и назад к ключицам',
     'Не отклоняй корпус назад дальше 15–20 градусов',
     'Не тяни рукоять за голову — это травмоопасно для плеч',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1598971639058-fab3c3109a00?w=500',
 ),
 Exercise(
   id: 'leg_press',
   title: 'Жим ногами в тренажере',
   muscleGroup: 'Ноги',
   locationType: 'gym',
   setsReps: '3 подхода по 12 повторений',
   weightRecommendationFormula: 'Свой вес x 0.8–1.0',
   criticalCheckpoints: [
     'Колени не вставлять в суставной замок в верхней точке!',
     'Поясница и таз плотно прижаты к спинке кресла',
     'Колени смотрят строго по направлению носков',
   ],
   animationUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=500',
 ),
];
 
class WorkoutGeneratorScreen extends StatefulWidget {
 const WorkoutGeneratorScreen({super.key});
 
 @override
 State<WorkoutGeneratorScreen> createState() => _WorkoutGeneratorScreenState();
}
 
class _WorkoutGeneratorScreenState extends State<WorkoutGeneratorScreen> {
 int age = 30;
 double height = 180;
 double weight = 78;
 String location = 'gym';
 String mode = 'single';
 String selectedFocus = 'Спина';
 
 List<Exercise> currentPlan = [];
 
 void generatePlan() {
   List<Exercise> filtered = exerciseDatabase.where((ex) {
     if (ex.locationType != location) return false;
     if (age < ex.minAge || age > ex.maxAgeSafety) return false;
     if (mode == 'single') {
       return ex.muscleGroup.contains(selectedFocus);
     }
     return true;
   }).toList();
 
   setState(() {
     currentPlan = filtered;
   });
 }
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('SmartFit Coach', style: TextStyle(fontWeight: FontWeight.bold)),
       backgroundColor: const Color(0xFF1E222D),
       elevation: 0,
     ),
     body: SingleChildScrollView(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           _buildCard(
             title: 'Твои данные',
             child: Column(
               children: [
                 Row(
                   children: [
                     Expanded(
                       child: _buildNumberInput('Возраст', '$age лет', () => _pickAge(context)),
                     ),
                     const SizedBox(width: 8),
                     Expanded(
                       child: _buildNumberInput('Рост', '${height.toInt()} см', () => _pickHeight(context)),
                     ),
                     const SizedBox(width: 8),
                     Expanded(
                       child: _buildNumberInput('Вес', '${weight.toInt()} кг', () => _pickWeight(context)),
                     ),
                   ],
                 ),
                 if (age < 18) ...[
                   const SizedBox(height: 12),
                   _buildWarningBadge('Исключены тяжелые осевые нагрузки на позвоночник.'),
                 ] else if (age >= 50) ...[
                   const SizedBox(height: 12),
                   _buildWarningBadge('Акцент на тренажеры и безопасность суставов.'),
                 ],
               ],
             ),
           ),
           const SizedBox(height: 16),
           _buildCard(
             title: 'Параметры тренировки',
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text('Место тренировки:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                 const SizedBox(height: 8),
                 Row(
                   children: [
                     _buildChip('Зал', location == 'gym', () {
                       setState(() => location = 'gym');
                     }),
                     const SizedBox(width: 8),
                     _buildChip('Улица / Турники', location == 'street', () {
                       setState(() => location = 'street');
                     }),
                   ],
                 ),
                 const SizedBox(height: 16),
                 const Text('Формат программы:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                 const SizedBox(height: 8),
                 Row(
                   children: [
                     _buildChip('1 Тренировка', mode == 'single', () {
                       setState(() => mode = 'single');
                     }),
                     const SizedBox(width: 8),
                     _buildChip('На неделю', mode == 'week', () {
                       setState(() => mode = 'week');
                     }),
                   ],
                 ),
                 if (mode == 'single') ...[
                   const SizedBox(height: 16),
                   const Text('Мышечная группа:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                   const SizedBox(height: 6),
                   DropdownButton<String>(
                     value: selectedFocus,
                     dropdownColor: const Color(0xFF2A2E3D),
                     isExpanded: true,
                     items: ['Спина', 'Грудь', 'Ноги'].map((String val) {
                       return DropdownMenuItem(value: val, child: Text(val));
                     }).toList(),
                     onChanged: (val) {
                       if (val != null) setState(() => selectedFocus = val);
                     },
                   ),
                 ],
               ],
             ),
           ),
           const SizedBox(height: 20),
           SizedBox(
             width: double.infinity,
             height: 50,
             child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                 backgroundColor: const Color(0xFF00E676),
                 foregroundColor: Colors.black,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
               ),
               onPressed: generatePlan,
               icon: const Icon(Icons.bolt),
               label: const Text('Сформировать план', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             ),
           ),
           const SizedBox(height: 24),
           if (currentPlan.isNotEmpty) ...[
             const Text('Упражнения на тренировку',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
             const SizedBox(height: 12),
             ListView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: currentPlan.length,
               itemBuilder: (context, index) {
                 return ExerciseDetailCard(exercise: currentPlan[index]);
               },
             ),
           ],
         ],
       ),
     ),
   );
 }
 
 Widget _buildCard({required String title, required Widget child}) {
   return Container(
     padding: const EdgeInsets.all(16),
     decoration: const BoxDecoration(
       color: Color(0xFF1E222D),
       borderRadius: BorderRadius.all(Radius.circular(16)),
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white70)),
         const SizedBox(height: 12),
         child,
       ],
     ),
   );
 }
 
 Widget _buildNumberInput(String label, String value, VoidCallback onTap) {
   return InkWell(
     onTap: onTap,
     borderRadius: const BorderRadius.all(Radius.circular(8)),
     child: Container(
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
       decoration: const BoxDecoration(
         color: Color(0xFF2A2E3D),
         borderRadius: BorderRadius.all(Radius.circular(8)),
       ),
       child: Column(
         children: [
           Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
           const SizedBox(height: 4),
           Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
         ],
       ),
     ),
   );
 }
 
 Widget _buildChip(String label, bool isSelected, VoidCallback onTap) {
   return ChoiceChip(
     label: Text(label),
     selected: isSelected,
     onSelected: (_) => onTap(),
     selectedColor: const Color(0xFF00E676),
     labelStyle: TextStyle(
       color: isSelected ? Colors.black : Colors.white,
       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
     ),
     backgroundColor: const Color(0xFF2A2E3D),
   );
 }
 
 Widget _buildWarningBadge(String text) {
   return Container(
     padding: const EdgeInsets.all(10),
     decoration: BoxDecoration(
       color: const Color(0x22FFA000),
       borderRadius: const BorderRadius.all(Radius.circular(8)),
       border: Border.all(color: const Color(0x88FFA000)),
     ),
     child: Row(
       children: [
         const Icon(Icons.info_outline, color: Color(0xFFFFA000), size: 18),
         const SizedBox(width: 8),
         Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFFFA000), fontSize: 12))),
       ],
     ),
   );
 }
 
 void _pickAge(BuildContext context) {
   _showNumberPicker('Возраст', age, 12, 85, (val) => setState(() => age = val));
 }
 
 void _pickHeight(BuildContext context) {
   _showNumberPicker('Рост (см)', height.toInt(), 130, 220, (val) => setState(() => height = val.toDouble()));
 }
 
 void _pickWeight(BuildContext context) {
   _showNumberPicker('Вес (кг)', weight.toInt(), 40, 160, (val) => setState(() => weight = val.toDouble()));
 }
 
 void _showNumberPicker(String title, int current, int min, int max, Function(int) onSelected) {
   showModalBottomSheet(
     context: context,
     backgroundColor: const Color(0xFF1E222D),
     builder: (ctx) {
       return Container(
         padding: const EdgeInsets.all(16),
         height: 280,
         child: Column(
           children: [
             Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             Expanded(
               child: ListView.builder(
                 itemCount: max - min + 1,
                 itemBuilder: (c, i) {
                   final val = min + i;
                   return ListTile(
                     title: Center(
                       child: Text(
                         '$val',
                         style: TextStyle(
                           fontSize: 16,
                           color: val == current ? const Color(0xFF00E676) : Colors.white70,
                           fontWeight: val == current ? FontWeight.bold : FontWeight.normal,
                         ),
                       ),
                     ),
                     onTap: () {
                       onSelected(val);
                       Navigator.pop(ctx);
                     },
                   );
                 },
               ),
             ),
           ],
         ),
       );
     },
   );
 }
}
 
class ExerciseDetailCard extends StatelessWidget {
 final Exercise exercise;
 
 const ExerciseDetailCard({super.key, required this.exercise});
 
 @override
 Widget build(BuildContext context) {
   return Card(
     color: const Color(0xFF1E222D),
     margin: const EdgeInsets.only(bottom: 16),
     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
     child: Padding(
       padding: const EdgeInsets.all(16),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               Expanded(
                 child: Text(
                   exercise.title,
                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                 ),
               ),
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 decoration: const BoxDecoration(
                   color: Color(0x3300E676),
                   borderRadius: BorderRadius.all(Radius.circular(6)),
                 ),
                 child: Text(
                   exercise.muscleGroup,
                   style: const TextStyle(color: Color(0xFF00E676), fontSize: 11, fontWeight: FontWeight.bold),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 12),
           ClipRRect(
             borderRadius: const BorderRadius.all(Radius.circular(12)),
             child: AspectRatio(
               aspectRatio: 16 / 9,
               child: Image.network(
                 exercise.animationUrl,
                 fit: BoxFit.cover,
                 errorBuilder: (_, __, ___) => Container(
                   color: const Color(0xFF2A2E3D),
                   child: const Center(child: Icon(Icons.fitness_center, size: 40, color: Colors.grey)),
                 ),
               ),
             ),
           ),
           const SizedBox(height: 14),
           Text('Подходы: ${exercise.setsReps}', style: const TextStyle(fontSize: 13, color: Colors.white70)),
           const SizedBox(height: 4),
           Text('Рекомендуемый вес: ${exercise.weightRecommendationFormula}',
               style: const TextStyle(fontSize: 13, color: Colors.white70)),
           const Divider(color: Colors.white12, height: 20),
           const Text(
             'Контроль техники (на что обратить внимание):',
             style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF2979FF)),
           ),
           const SizedBox(height: 6),
           ...exercise.criticalCheckpoints.map(
             (point) => Padding(
               padding: const EdgeInsets.only(bottom: 4),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('• ', style: TextStyle(color: Color(0xFF00E676), fontWeight: FontWeight.bold)),
                   Expanded(
                     child: Text(
                       point,
                       style: const TextStyle(fontSize: 13, color: Colors.white, height: 1.25),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ],
       ),
     ),
   );
 }
}
