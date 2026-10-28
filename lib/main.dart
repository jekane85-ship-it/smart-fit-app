@override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E222D),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                  decoration: BoxDecoration(
                    color: const Color(0x3300E676),
                    borderRadius: BorderRadius.circular(6),
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
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  exercise.animationUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, , _) => Container(
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
                child: Row
