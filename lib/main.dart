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

// Карточка с техникой и визуализацией
class ExerciseDetailCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailCard({super.key, required this.exercise});

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
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00E676).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    exercise.muscleGroup,
                    style: const TextStyle(color: Color(0xFF00E676), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Иллюстрация / GIF
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  exercise.animationUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, , _) => Container(
                    color: const Color(0xFF2A2E3D),
                    child: const Center(child: Icon(Icons.fitness_center, size: 48, color: Colors.grey)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Нагрузка
            Row(
              children: [
                const Icon(Icons.repeat, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(exercise.setsReps, style: const TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.scale, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Вес: ${exercise.weightRecommendationFormula}',
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white12, height: 24),

            // Ключевой блок: Контрольные точки техники
            const Row(
              children: [
                Icon(Icons.remove_red_eye_outlined, size: 18, color: Color(0xFF2979FF)),
                SizedBox(width: 6),
                Text(
                  'Контроль техники (за чем следить):',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2979FF)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...exercise.criticalCheckpoints.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: Color(0xFF00E676), fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 13, color: Colors.white, height: 1.3),
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
