const List<List<Map<String, Object>>> allQuestionSets = [
  // --- 세트 1 ---
  [
    // E/I
    {'questionText': '주말에 당신은...', 'answers': [{'text': '친구들과 만나 파티를 즐긴다.', 'type': 'E'}, {'text': '집에서 조용히 혼자 시간을 보낸다.', 'type': 'I'}]},
    {'questionText': '새로운 사람을 만났을 때...', 'answers': [{'text': '먼저 말을 걸며 대화를 주도한다.', 'type': 'E'}, {'text': '상대방이 말을 걸 때까지 기다린다.', 'type': 'I'}]},
    {'questionText': '에너지를 얻는 방식은?', 'answers': [{'text': '사람들과의 교류를 통해', 'type': 'E'}, {'text': '혼자만의 시간을 통해', 'type': 'I'}]},
    {'questionText': '단체 활동에서 당신의 역할은?', 'answers': [{'text': '주로 대화를 이끌고 분위기를 띄운다.', 'type': 'E'}, {'text': '주로 다른 사람의 이야기를 듣는다.', 'type': 'I'}]},
    {'questionText': '관심사가 같은 새로운 모임에 나갔다. 당신은?', 'answers': [{'text': '여러 사람과 빠르게 친해지며 대화한다.', 'type': 'E'}, {'text': '마음이 맞는 한두 사람과 깊은 대화를 나눈다.', 'type': 'I'}]},
    // S/N
    {'questionText': '일을 처리할 때...', 'answers': [{'text': '현실적이고 실제적인 방법을 선호한다.', 'type': 'S'}, {'text': '미래의 가능성과 아이디어를 중시한다.', 'type': 'N'}]},
    {'questionText': '숲을 본다면?', 'answers': [{'text': '나무, 꽃 등 구체적인 것들이 보인다.', 'type': 'S'}, {'text': '숲 전체의 분위기와 의미를 생각한다.', 'type': 'N'}]},
    {'questionText': '더 중요한 것은?', 'answers': [{'text': '현재의 사실', 'type': 'S'}, {'text': '미래의 가능성', 'type': 'N'}]},
    {'questionText': '새로운 기기를 샀을 때, 당신은?', 'answers': [{'text': '설명서를 꼼꼼히 읽고 순서대로 따른다.', 'type': 'S'}, {'text': '일단 전원부터 켜고 직접 만져보며 익힌다.', 'type': 'N'}]},
    {'questionText': '친구에게 길을 설명해줄 때, 당신은?', 'answers': [{'text': '"편의점 보이면 우회전해서 100미터 직진해"', 'type': 'S'}, {'text': '"저쪽 큰 건물 방향으로 쭉 가다 보면 보일거야"', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 고민을 털어놓을 때...', 'answers': [{'text': '논리적인 해결책을 제시해준다.', 'type': 'T'}, {'text': '따뜻한 말로 공감하고 위로해준다.', 'type': 'F'}]},
    {'questionText': '결정을 내릴 때 기준은?', 'answers': [{'text': '객관적인 사실과 원칙', 'type': 'T'}, {'text': '사람들과의 관계와 감정', 'type': 'F'}]},
    {'questionText': '더 듣고 싶은 말은?', 'answers': [{'text': '"똑똑하네요"', 'type': 'T'}, {'text': '"친절하네요"', 'type': 'F'}]},
    {'questionText': '팀 프로젝트에서 갈등이 생겼을 때, 당신은?', 'answers': [{'text': '무엇이 가장 효율적인지 따져서 결정한다.', 'type': 'T'}, {'text': '팀원들의 감정이 상하지 않도록 중재한다.', 'type': 'F'}]},
    {'questionText': '영화 감상 후, 당신의 감상평은?', 'answers': [{'text': '줄거리의 개연성과 연출력을 분석한다.', 'type': 'T'}, {'text': '주인공의 감정선에 깊이 몰입하여 이야기한다.', 'type': 'F'}]},
    // J/P
    {'questionText': '여행을 간다면...', 'answers': [{'text': '미리 철저하게 계획을 세운다.', 'type': 'J'}, {'text': '상황에 따라 즉흥적으로 즐긴다.', 'type': 'P'}]},
    {'questionText': '나의 생활 방식은?', 'answers': [{'text': '체계적이고 정리정돈이 잘 되어 있다.', 'type': 'J'}, {'text': '자유롭고 유연하게 대처한다.', 'type': 'P'}]},
    {'questionText': '마감 기한이 다가올 때...', 'answers': [{'text': '미리미리 끝내고 여유를 가진다.', 'type': 'J'}, {'text': '마감 직전에 집중해서 처리한다.', 'type': 'P'}]},
    {'questionText': '갑자기 친구가 만나자고 할 때, 당신은?', 'answers': [{'text': '이미 세워둔 계획이 있어 거절한다.', 'type': 'J'}, {'text': '재미있을 것 같으면 즉흥적으로 나간다.', 'type': 'P'}]},
    {'questionText': '당신의 책상은?', 'answers': [{'text': '항상 깔끔하게 정돈되어 있다.', 'type': 'J'}, {'text': '필요한 물건들이 손 닿는 곳에 자연스럽게 놓여있다.', 'type': 'P'}]},
  ],
  // --- 세트 2 (기존) ---
  [
    // E/I
    {'questionText': '낯선 사람들과의 저녁 식사 자리, 당신은?', 'answers': [{'text': '옆 사람과 스스럼없이 대화를 시작한다.', 'type': 'E'}, {'text': '조용히 식사하며 다른 사람들을 관찰한다.', 'type': 'I'}]},
    {'questionText': '큰 프로젝트를 끝낸 후, 당신의 휴식 방법은?', 'answers': [{'text': '성공을 자축하는 파티에 참석한다.', 'type': 'E'}, {'text': '좋아하는 영화를 보며 혼자 쉰다.', 'type': 'I'}]},
    {'questionText': '당신이 선호하는 업무 환경은?', 'answers': [{'text': '동료들과 소통하는 개방된 공간', 'type': 'E'}, {'text': '혼자 집중할 수 있는 조용한 공간', 'type': 'I'}]},
    {'questionText': '휴가 계획을 세울 때, 당신의 스타일은?', 'answers': [{'text': '친구들에게 연락해 함께 갈 계획을 짠다.', 'type': 'E'}, {'text': '가고 싶은 곳을 혼자 찾아보며 상상한다.', 'type': 'I'}]},
    {'questionText': '당신은 주로 어떻게 정보를 얻는가?', 'answers': [{'text': '사람들과의 대화나 토론을 통해', 'type': 'E'}, {'text': '책이나 인터넷 검색을 통해', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 더 신뢰하는 것은?', 'answers': [{'text': '직접 경험하고 확인한 사실', 'type': 'S'}, {'text': '영감이나 직감으로 느껴지는 것', 'type': 'N'}]},
    {'questionText': '영화를 볼 때 더 흥미로운 부분은?', 'answers': [{'text': '현실적인 캐릭터와 구체적인 사건 전개', 'type': 'S'}, {'text': '영화에 담긴 상징이나 숨겨진 의미', 'type': 'N'}]},
    {'questionText': '새로운 것을 배울 때 선호하는 방식은?', 'answers': [{'text': '실제 사례를 통해 단계별로 학습한다.', 'type': 'S'}, {'text': '전체적인 개념과 원리를 먼저 이해한다.', 'type': 'N'}]},
    {'questionText': '이야기를 할 때 당신의 스타일은?', 'answers': [{'text': '사실을 바탕으로 순서대로 이야기한다.', 'type': 'S'}, {'text': '주제를 넘나들며 비유적으로 이야기한다.', 'type': 'N'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '실용성과 효율성', 'type': 'S'}, {'text': '독창성과 가능성', 'type': 'N'}]},
    // T/F
    {'questionText': '다른 사람을 칭찬할 때, 당신은?', 'answers': [{'text': '"일 처리가 아주 정확하고 뛰어나네요."', 'type': 'T'}, {'text': '"당신과 함께 일해서 정말 즐거웠어요."', 'type': 'F'}]},
    {'questionText': '당신이 생각하는 "좋은 결정"이란?', 'answers': [{'text': '가장 합리적이고 공정한 결과', 'type': 'T'}, {'text': '모두가 만족하고 화합하는 결과', 'type': 'F'}]},
    {'questionText': '친구가 새로 산 옷을 보여줄 때, 당신의 반응은?', 'answers': [{'text': '옷의 재질이나 디자인에 대해 객관적으로 평가한다.', 'type': 'T'}, {'text': '"너한테 정말 잘 어울린다!"라고 말해준다.', 'type': 'F'}]},
    {'questionText': '당신에게 더 중요한 것은?', 'answers': [{'text': '진실과 사실', 'type': 'T'}, {'text': '타인에 대한 배려', 'type': 'F'}]},
    {'questionText': '슬픈 영화를 보고 난 후, 당신은?', 'answers': [{'text': '스토리의 허점을 찾아내거나 감독의 의도를 분석한다.', 'type': 'T'}, {'text': '한동안 감정에 빠져 여운을 느낀다.', 'type': 'F'}]},
    // J/P
    {'questionText': '당신의 방은 보통 어떤 상태인가?', 'answers': [{'text': '물건들이 각자 제자리에 정리되어 있다.', 'type': 'J'}, {'text': '자유분방하지만 나름의 질서가 있다.', 'type': 'P'}]},
    {'questionText': '식당 메뉴를 고를 때, 당신은?', 'answers': [{'text': '미리 리뷰를 보고 메뉴를 정해놓고 간다.', 'type': 'J'}, {'text': '그날의 기분에 따라 즉흥적으로 주문한다.', 'type': 'P'}]},
    {'questionText': '일상생활에서 당신은?', 'answers': [{'text': '정해진 루틴을 따르는 것을 편안하게 느낀다.', 'type': 'J'}, {'text': '새롭고 예측 불가능한 상황을 즐긴다.', 'type': 'P'}]},
    {'questionText': '일을 끝내는 기준은?', 'answers': [{'text': '정해진 목표와 기준을 완벽하게 만족시켰을 때', 'type': 'J'}, {'text': '이만하면 괜찮다고 만족스러울 때', 'type': 'P'}]},
    {'questionText': '쇼핑할 때 당신의 모습은?', 'answers': [{'text': '구매 목록을 작성하고 계획적으로 쇼핑한다.', 'type': 'J'}, {'text': '돌아다니다가 마음에 드는 것이 보이면 산다.', 'type': 'P'}]},
  ],
  // --- 세트 3 (기존) ---
  [
    // E/I
    {'questionText': '당신에게 더 익숙한 것은?', 'answers': [{'text': '내 생각을 말로 표현하는 것', 'type': 'E'}, {'text': '내 생각을 글로 정리하는 것', 'type': 'I'}]},
    {'questionText': '당신은 파티에서 주로 어떤 사람인가?', 'answers': [{'text': '중심에서 여러 사람과 어울린다.', 'type': 'E'}, {'text': '구석에서 소수의 사람과 이야기한다.', 'type': 'I'}]},
    {'questionText': '당신의 전화 통화 스타일은?', 'answers': [{'text': '용건 외에도 다양한 이야기를 나눈다.', 'type': 'E'}, {'text': '용건만 간단히 말하고 끊는다.', 'type': 'I'}]},
    {'questionText': '힘든 일이 있을 때, 당신은?', 'answers': [{'text': '친구에게 털어놓으며 에너지를 얻는다.', 'type': 'E'}, {'text': '혼자만의 시간을 가지며 정리한다.', 'type': 'I'}]},
    {'questionText': '당신이 선호하는 팀 규모는?', 'answers': [{'text': '많은 사람들과 함께하는 대규모 팀', 'type': 'E'}, {'text': '소수의 인원으로 구성된 소규모 팀', 'type': 'I'}]},
    // S/N
    {'questionText': '새로운 프로젝트를 시작할 때, 당신은?', 'answers': [{'text': '구체적인 계획과 일정을 먼저 세운다.', 'type': 'S'}, {'text': '큰 그림과 최종 목표를 먼저 상상한다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 사람으로 기억되고 싶은가?', 'answers': [{'text': '믿을 수 있고 현실적인 사람', 'type': 'S'}, {'text': '창의적이고 비전이 있는 사람', 'type': 'N'}]},
    {'questionText': '선물을 고를 때, 당신은?', 'answers': [{'text': '상대방이 실제로 필요로 하는 실용적인 것을 고른다.', 'type': 'S'}, {'text': '상대방에게 특별한 의미를 줄 수 있는 것을 고른다.', 'type': 'N'}]},
    {'questionText': '당신이 더 끌리는 이야기는?', 'answers': [{'text': '역사적 사실을 바탕으로 한 이야기', 'type': 'S'}, {'text': '상상 속 세계를 다루는 판타지 이야기', 'type': 'N'}]},
    {'questionText': '세상을 이해하는 방식은?', 'answers': [{'text': '오감을 통해 직접 경험하며 이해한다.', 'type': 'S'}, {'text': '사건들 사이의 연관성이나 패턴을 통해 이해한다.', 'type': 'N'}]},
    // T/F
    {'questionText': '다른 사람의 의견에 동의하지 않을 때, 당신은?', 'answers': [{'text': '논리적인 근거를 들어 반박한다.', 'type': 'T'}, {'text': '상대방의 기분을 고려해 완곡하게 표현한다.', 'type': 'F'}]},
    {'questionText': '당신에게 "정의"란?', 'answers': [{'text': '모두에게 공평하게 적용되는 원칙', 'type': 'T'}, {'text': '상황에 따라 유연하게 적용되는 조화', 'type': 'F'}]},
    {'questionText': '당신이 리더가 된다면, 어떤 리더가 될 것인가?', 'answers': [{'text': '목표 달성을 위해 팀을 효율적으로 이끄는 리더', 'type': 'T'}, {'text': '팀원들의 사기를 북돋우며 화합을 이끄는 리더', 'type': 'F'}]},
    {'questionText': '당신이 더 불편한 상황은?', 'answers': [{'text': '비논리적이고 감정적으로 말하는 사람을 대할 때', 'type': 'T'}, {'text': '냉정하고 직설적으로 말하는 사람을 대할 때', 'type': 'F'}]},
    {'questionText': '문제가 해결되었을 때, 당신이 느끼는 감정은?', 'answers': [{'text': '문제가 논리적으로 해결되었다는 것에 대한 만족감', 'type': 'T'}, {'text': '상황이 원만하게 해결되었다는 것에 대한 안도감', 'type': 'F'}]},
    // J/P
    {'questionText': '아침에 일어났을 때, 당신은?', 'answers': [{'text': '오늘 할 일을 순서대로 머릿속에 그린다.', 'type': 'J'}, {'text': '그때그때 상황에 맞춰 하루를 보낸다.', 'type': 'P'}]},
    {'questionText': '당신은 어떤 환경에서 더 능률이 오르는가?', 'answers': [{'text': '모든 것이 예측 가능하고 정돈된 환경', 'type': 'J'}, {'text': '자유롭고 변화의 가능성이 열린 환경', 'type': 'P'}]},
    {'questionText': '결정을 내린 후에 당신은?', 'answers': [{'text': '결정을 거의 바꾸지 않는다.', 'type': 'J'}, {'text': '더 좋은 선택지가 보이면 결정을 바꿀 수 있다.', 'type': 'P'}]},
    {'questionText': '당신에게 "자유"란?', 'answers': [{'text': '목표를 모두 달성하고 얻는 마음의 평화', 'type': 'J'}, {'text': '어떤 것에도 얽매이지 않는 즉흥적인 삶', 'type': 'P'}]},
    {'questionText': '새로운 일을 시작할 때, 당신은?', 'answers': [{'text': '명확한 목표와 마감일이 주어지는 것을 선호한다.', 'type': 'J'}, {'text': '자유롭게 탐색하며 진행하는 것을 선호한다.', 'type': 'P'}]},
  ],
  // --- 세트 4 (기존) ---
  [
    // E/I
    {'questionText': '문제 해결 시, 당신이 먼저 하는 것은?', 'answers': [{'text': '주변 사람들과 브레인스토밍을 한다.', 'type': 'E'}, {'text': '혼자 조용히 문제에 대해 깊이 생각한다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 종류의 칭찬을 더 선호하는가?', 'answers': [{'text': '많은 사람들 앞에서 공개적으로 받는 칭찬', 'type': 'E'}, {'text': '개인적으로 조용히 전달받는 칭찬', 'type': 'I'}]},
    {'questionText': '당신은 대화를 할 때 주로', 'answers': [{'text': '말을 많이 하는 편이다.', 'type': 'E'}, {'text': '듣는 것을 더 많이 하는 편이다.', 'type': 'I'}]},
    {'questionText': '새로운 취미를 시작한다면?', 'answers': [{'text': '동호회나 그룹에 가입한다.', 'type': 'E'}, {'text': '온라인 강의를 들으며 혼자 시작한다.', 'type': 'I'}]},
    {'questionText': '당신은 주로 어떻게 알려져 있는가?', 'answers': [{'text': '사교적이고 활동적인 사람', 'type': 'E'}, {'text': '신중하고 내성적인 사람', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 더 선호하는 영화 장르는?', 'answers': [{'text': '실화를 바탕으로 한 현실적인 영화', 'type': 'S'}, {'text': '독창적인 세계관을 가진 추상적인 영화', 'type': 'N'}]},
    {'questionText': '당신에게 "집"이란?', 'answers': [{'text': '편안하게 쉴 수 있는 구체적인 공간', 'type': 'S'}, {'text': '나의 정체성과 이상을 담고 있는 개념', 'type': 'N'}]},
    {'questionText': '여행지를 선택하는 기준은?', 'answers': [{'text': '검증된 맛집과 볼거리가 많은 곳', 'type': 'S'}, {'text': '새로운 영감을 얻을 수 있는 독특한 곳', 'type': 'N'}]},
    {'questionText': '당신은 어떤 정보를 더 잘 기억하는가?', 'answers': [{'text': '사람의 이름, 날짜, 통계 등 구체적인 정보', 'type': 'S'}, {'text': '전체적인 맥락이나 사람의 인상 등 추상적인 정보', 'type': 'N'}]},
    {'questionText': '당신이 더 동의하는 말은?', 'answers': [{'text': '"백문이 불여일견"', 'type': 'S'}, {'text': '"아는 만큼 보인다"', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 사업 아이템에 대해 조언을 구할 때, 당신은?', 'answers': [{'text': '사업의 장단점과 시장성을 냉정하게 분석해준다.', 'type': 'T'}, {'text': '친구의 열정을 응원하며 격려해준다.', 'type': 'F'}]},
    {'questionText': '당신이 생각하는 "성장"이란?', 'answers': [{'text': '지식과 기술을 습득하여 능력이 향상되는 것', 'type': 'T'}, {'text': '자아를 성찰하며 인격적으로 성숙해지는 것', 'type': 'F'}]},
    {'questionText': '선물을 받았을 때, 당신이 더 기쁜 이유는?', 'answers': [{'text': '나에게 꼭 필요한 실용적인 선물이라서', 'type': 'T'}, {'text': '나를 생각해준 그 마음이 느껴져서', 'type': 'F'}]},
    {'questionText': '당신은 어떤 상사 밑에서 일하고 싶은가?', 'answers': [{'text': '공과 사가 확실하고 공정하게 평가하는 상사', 'type': 'T'}, {'text': '인간적으로 대해주고 격려해주는 따뜻한 상사', 'type': 'F'}]},
    {'questionText': '당신이 더 참을 수 없는 것은?', 'answers': [{'text': '비합리적인 규칙과 절차', 'type': 'T'}, {'text': '인간적인 배려가 없는 무례한 행동', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 약속 시간에?', 'answers': [{'text': '보통 10분 전에 미리 도착한다.', 'type': 'J'}, {'text': '시간에 맞춰 도착하거나 조금 늦을 때도 있다.', 'type': 'P'}]},
    {'questionText': '할 일이 여러 개 있을 때, 당신은?', 'answers': [{'text': '리스트를 만들어 하나씩 처리해나간다.', 'type': 'J'}, {'text': '그때그때 끌리는 일부터 시작한다.', 'type': 'P'}]},
    {'questionText': '당신에게 "계획"이란?', 'answers': [{'text': '반드시 따라야 하는 지침', 'type': 'J'}, {'text': '상황에 따라 바뀔 수 있는 가이드라인', 'type': 'P'}]},
    {'questionText': '당신은 결정을 내릴 때?', 'answers': [{'text': '충분한 정보를 바탕으로 신속하게 결정한다.', 'type': 'J'}, {'text': '가능성을 열어두고 마지막까지 고민한다.', 'type': 'P'}]},
    {'questionText': '갑작스러운 변화에 대한 당신의 반응은?', 'answers': [{'text': '계획이 틀어져서 스트레스를 받는다.', 'type': 'J'}, {'text': '새로운 상황에 흥미를 느끼고 적응한다.', 'type': 'P'}]},
  ],
  // --- 세트 5 (기존) ---
  [
    // E/I
    {'questionText': '당신의 휴대폰은 주로?', 'answers': [{'text': '친구들과의 통화와 메시지로 바쁘다.', 'type': 'E'}, {'text': '알람이나 정보 검색용으로 조용하다.', 'type': 'I'}]},
    {'questionText': '처음 가는 장소에서, 당신은?', 'answers': [{'text': '주변 사람들에게 적극적으로 길을 물어본다.', 'type': 'E'}, {'text': '지도를 보며 조용히 혼자 길을 찾는다.', 'type': 'I'}]},
    {'questionText': '당신은 주로 어떤 방식으로 배우는가?', 'answers': [{'text': '그룹 스터디나 토론을 통해', 'type': 'E'}, {'text': '혼자 책을 읽거나 강의를 들으며', 'type': 'I'}]},
    {'questionText': '당신은 자신을 소개할 때?', 'answers': [{'text': '자신에 대한 다양한 이야기를 편하게 한다.', 'type': 'E'}, {'text': '필요한 정보 위주로 간략하게 말한다.', 'type': 'I'}]},
    {'questionText': '당신의 생각은 언제 가장 잘 정리되는가?', 'answers': [{'text': '다른 사람에게 설명하면서', 'type': 'E'}, {'text': '혼자 조용히 일기를 쓰면서', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 더 선호하는 휴가는?', 'answers': [{'text': '편안한 리조트에서 즐기는 구체적인 활동들', 'type': 'S'}, {'text': '미지의 장소를 탐험하는 자유로운 상상', 'type': 'N'}]},
    {'questionText': '어떤 종류의 이야기에 더 끌리는가?', 'answers': [{'text': '실제 경험담이나 현실적인 조언', 'type': 'S'}, {'text': '새로운 아이디어나 철학적인 담론', 'type': 'N'}]},
    {'questionText': '당신은 기억을 어떻게 하는 편인가?', 'answers': [{'text': '사건의 세부사항을 사진처럼 생생하게 기억한다.', 'type': 'S'}, {'text': '사건의 전반적인 느낌이나 의미를 기억한다.', 'type': 'N'}]},
    {'questionText': '당신이 더 중요하게 생각하는 교육은?', 'answers': [{'text': '실생활에 바로 적용할 수 있는 실용 교육', 'type': 'S'}, {'text': '사고의 폭을 넓혀주는 인문학 교육', 'type': 'N'}]},
    {'questionText': '당신이 더 자주 사용하는 표현은?', 'answers': [{'text': '"그래서 구체적으로 어떻게 하는 건데?"', 'type': 'S'}, {'text': '"만약 ~한다면 어떨까?"', 'type': 'N'}]},
    // T/F
    {'questionText': '당신이 동료를 평가하는 기준은?', 'answers': [{'text': '업무 성과와 능력', 'type': 'T'}, {'text': '팀워크와 성격', 'type': 'F'}]},
    {'questionText': '당신이 더 듣기 불편한 말은?', 'answers': [{'text': '"네 말은 논리적으로 말이 안 돼."', 'type': 'T'}, {'text': '"네가 어떻게 나한테 그럴 수 있어?"', 'type': 'F'}]},
    {'questionText': '의견 대립이 있을 때, 당신은?', 'answers': [{'text': '누가 옳은지 토론으로 결론을 내야 한다고 생각한다.', 'type': 'T'}, {'text': '서로의 입장을 존중하며 갈등을 피해야 한다고 생각한다.', 'type': 'F'}]},
    {'questionText': '당신에게 "친구"란?', 'answers': [{'text': '지적으로 자극을 주고받는 토론 상대', 'type': 'T'}, {'text': '정서적으로 지지해주고 위로해주는 존재', 'type': 'F'}]},
    {'questionText': '다른 사람을 도울 때, 당신은?', 'answers': [{'text': '문제를 해결할 수 있는 실질적인 방법을 알려준다.', 'type': 'T'}, {'text': '이야기를 들어주며 정서적으로 지지해준다.', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 쇼핑을 할 때?', 'answers': [{'text': '필요한 물건만 사고 바로 나온다.', 'type': 'J'}, {'text': '이것저것 구경하며 아이쇼핑을 즐긴다.', 'type': 'P'}]},
    {'questionText': '당신은 결정을 내릴 때 어떤 편인가?', 'answers': [{'text': '한번 결정하면 끝까지 밀고 나간다.', 'type': 'J'}, {'text': '상황에 따라 유연하게 계획을 변경한다.', 'type': 'P'}]},
    {'questionText': '당신은 일을 할 때?', 'answers': [{'text': '업무 시간과 휴식 시간을 명확히 구분한다.', 'type': 'J'}, {'text': '일과 놀이의 경계가 불분명하다.', 'type': 'P'}]},
    {'questionText': '당신에게 더 어려운 것은?', 'answers': [{'text': '정해진 일 없이 하루를 보내는 것', 'type': 'J'}, {'text': '빡빡한 일정에 맞춰 하루를 보내는 것', 'type': 'P'}]},
    {'questionText': '당신의 여행 가방은?', 'answers': [{'text': '미리 싼 체크리스트를 보며 꼼꼼하게 챙긴다.', 'type': 'J'}, {'text': '출발 직전에 생각나는 대로 챙긴다.', 'type': 'P'}]},
  ],
  // --- 세트 6 (신규) ---
  [
    // E/I
    {'questionText': '새로운 직장/학교 첫날, 당신은?', 'answers': [{'text': '먼저 주변 사람들에게 다가가 인사한다.', 'type': 'E'}, {'text': '누군가 말을 걸어줄 때까지 기다린다.', 'type': 'I'}]},
    {'questionText': '스트레스를 풀기 위해 당신이 하는 것은?', 'answers': [{'text': '친구들을 불러 술 한잔하거나 수다를 떤다.', 'type': 'E'}, {'text': '침대에서 뒹굴거리거나 혼자 게임을 한다.', 'type': 'I'}]},
    {'questionText': '당신의 주말 일정은?', 'answers': [{'text': '약속으로 꽉 차 있어 바쁘다.', 'type': 'E'}, {'text': '특별한 일 없이 집에서 쉰다.', 'type': 'I'}]},
    {'questionText': '당신은 생각할 때?', 'answers': [{'text': '일단 말하면서 생각을 정리한다.', 'type': 'E'}, {'text': '속으로 충분히 생각한 뒤에 말한다.', 'type': 'I'}]},
    {'questionText': '엘리베이터에 이웃과 단둘이 탔을 때?', 'answers': [{'text': '가벼운 스몰토크를 시도한다.', 'type': 'E'}, {'text': '어색하게 층수만 바라보거나 폰을 본다.', 'type': 'I'}]},
    // S/N
    {'questionText': '요리를 할 때 당신은?', 'answers': [{'text': '레시피를 정확하게 계량해서 따른다.', 'type': 'S'}, {'text': '대충 감으로 간을 보며 내 맘대로 한다.', 'type': 'N'}]},
    {'questionText': '미래에 대해 생각할 때?', 'answers': [{'text': '내일 당장 해야 할 일부터 걱정한다.', 'type': 'S'}, {'text': '5년 후, 10년 후의 내 모습을 상상한다.', 'type': 'N'}]},
    {'questionText': '당신의 관심사는?', 'answers': [{'text': '최신 유행, 맛집, 연예인 뉴스', 'type': 'S'}, {'text': '우주, 사후세계, 평행우주론', 'type': 'N'}]},
    {'questionText': '설명서를 읽을 때?', 'answers': [{'text': '처음부터 끝까지 꼼꼼히 읽는다.', 'type': 'S'}, {'text': '그림만 대충 보고 넘긴다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 사람으로 불리는가?', 'answers': [{'text': '꼼꼼하고 현실적인 사람', 'type': 'S'}, {'text': '엉뚱하고 상상력이 풍부한 사람', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 우울해서 빵 샀어"라고 하면?', 'answers': [{'text': '"무슨 빵 샀어?" (팩트 체크)', 'type': 'T'}, {'text': '"무슨 일 있었어? 왜 우울해 ㅠㅠ" (공감)', 'type': 'F'}]},
    {'questionText': '누군가와 논쟁할 때 당신의 목표는?', 'answers': [{'text': '논리적으로 상대를 이기는 것', 'type': 'T'}, {'text': '서로 기분 상하지 않게 잘 마무리하는 것', 'type': 'F'}]},
    {'questionText': '거절을 해야 할 때?', 'answers': [{'text': '안 되는 이유를 명확하게 설명한다.', 'type': 'T'}, {'text': '상처받지 않게 돌려 말하느라 힘들다.', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 여기는 가치는?', 'answers': [{'text': '정직과 공정성', 'type': 'T'}, {'text': '조화와 자비', 'type': 'F'}]},
    {'questionText': '슬픈 드라마를 볼 때?', 'answers': [{'text': '"저 상황에서 저게 말이 돼?" 분석한다.', 'type': 'T'}, {'text': '주인공에 이입해서 눈물을 흘린다.', 'type': 'F'}]},
    // J/P
    {'questionText': '여행 짐 쌀 때 당신은?', 'answers': [{'text': '며칠 전부터 리스트를 보며 하나씩 챙긴다.', 'type': 'J'}, {'text': '출발 직전에 후다닥 챙겨 넣는다.', 'type': 'P'}]},
    {'questionText': '오늘 할 일을 다 못 끝냈다면?', 'answers': [{'text': '스트레스 받아서 잠이 안 온다.', 'type': 'J'}, {'text': '내일 하면 되지 뭐, 하고 잔다.', 'type': 'P'}]},
    {'questionText': '친구와의 약속이 갑자기 취소되면?', 'answers': [{'text': '비어버린 시간에 뭘 할지 다시 계획한다.', 'type': 'J'}, {'text': '오히려 좋아! 집에서 쉰다.', 'type': 'P'}]},
    {'questionText': '당신의 컴퓨터 바탕화면은?', 'answers': [{'text': '폴더별로 깔끔하게 정리되어 있다.', 'type': 'J'}, {'text': '파일들이 어지럽게 널려 있다.', 'type': 'P'}]},
    {'questionText': '일할 때 당신의 스타일은?', 'answers': [{'text': '마감 기한보다 여유 있게 끝낸다.', 'type': 'J'}, {'text': '발등에 불이 떨어져야 시작한다.', 'type': 'P'}]},
  ],
  // --- 세트 7 (신규) ---
  [
    // E/I
    {'questionText': '당신은 혼자 있는 시간이 길어지면?', 'answers': [{'text': '심심하고 무기력해진다.', 'type': 'E'}, {'text': '에너지가 충전되고 편안하다.', 'type': 'I'}]},
    {'questionText': '회식 자리에서 당신은?', 'answers': [{'text': '2차, 3차까지 끝까지 남는다.', 'type': 'E'}, {'text': '눈치 보다가 조용히 빠져나간다.', 'type': 'I'}]},
    {'questionText': '친구 생일 파티에 초대받았다면?', 'answers': [{'text': '새로운 사람들을 만날 생각에 설렌다.', 'type': 'E'}, {'text': '아는 사람이 몇 명이나 오는지부터 확인한다.', 'type': 'I'}]},
    {'questionText': '당신은 대화할 때?', 'answers': [{'text': '제스처를 크게 하고 목소리가 크다.', 'type': 'E'}, {'text': '조곤조곤하게 필요한 말만 한다.', 'type': 'I'}]},
    {'questionText': '주말에 집에만 있으면?', 'answers': [{'text': '시간이 아깝다는 생각이 든다.', 'type': 'E'}, {'text': '진정한 휴식을 취했다고 느낀다.', 'type': 'I'}]},
    // S/N
    {'questionText': '멍 때릴 때 당신의 머릿속은?', 'answers': [{'text': '아무 생각 없거나 배고프다는 생각.', 'type': 'S'}, {'text': '만약 좀비가 나타나면 어떡하지? 하는 상상.', 'type': 'N'}]},
    {'questionText': '노래를 들을 때 더 집중하는 것은?', 'answers': [{'text': '멜로디와 비트', 'type': 'S'}, {'text': '가사의 숨은 의미', 'type': 'N'}]},
    {'questionText': '길을 찾을 때?', 'answers': [{'text': '"편의점에서 우회전" 같은 지형지물을 본다.', 'type': 'S'}, {'text': '지도 앱의 방향과 전체적인 위치를 본다.', 'type': 'N'}]},
    {'questionText': '미술관에서 그림을 볼 때?', 'answers': [{'text': '색감이나 붓터치 같은 기법을 본다.', 'type': 'S'}, {'text': '작가가 무슨 생각으로 그렸을지 상상한다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 말을 더 신뢰하나?', 'answers': [{'text': '구체적인 통계 자료와 수치', 'type': 'S'}, {'text': '직감적인 느낌과 가능성', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 시험 망쳤어"라고 하면?', 'answers': [{'text': '"몇 점인데? 어디가 틀렸어?"', 'type': 'T'}, {'text': '"아이고... 많이 속상했겠다. 밥은 먹었어?"', 'type': 'F'}]},
    {'questionText': '당신에게 더 큰 상처는?', 'answers': [{'text': '무능력하다는 비판', 'type': 'T'}, {'text': '나를 싫어한다는 느낌', 'type': 'F'}]},
    {'questionText': '조별 과제 무임승차자를 볼 때?', 'answers': [{'text': '참여 안 했으니 이름 뺀다고 통보한다.', 'type': 'T'}, {'text': '미워도 일단 사정이 있겠거니 하고 넘어간다.', 'type': 'F'}]},
    {'questionText': '결정을 내릴 때 가장 방해되는 것은?', 'answers': [{'text': '부족한 정보', 'type': 'T'}, {'text': '주변 사람들의 시선', 'type': 'F'}]},
    {'questionText': '당신이 더 듣고 싶은 칭찬은?', 'answers': [{'text': '"너 진짜 똑똑하다. 일 잘한다."', 'type': 'T'}, {'text': '"너는 정말 따뜻하고 좋은 사람이야."', 'type': 'F'}]},
    // J/P
    {'questionText': '맛집을 갈 때?', 'answers': [{'text': '예약하고 브레이크 타임까지 확인한다.', 'type': 'J'}, {'text': '일단 가서 자리 있으면 먹고 없으면 딴 데 간다.', 'type': 'P'}]},
    {'questionText': '데이트 계획을 짤 때?', 'answers': [{'text': '동선과 시간을 고려해 짠다.', 'type': 'J'}, {'text': '만나서 뭐 할지 정한다.', 'type': 'P'}]},
    {'questionText': '당신의 다이어리(플래너)는?', 'answers': [{'text': '일정이 빽빽하게 적혀 있다.', 'type': 'J'}, {'text': '몇 장 쓰다가 말아서 깨끗하다.', 'type': 'P'}]},
    {'questionText': '알람을 맞출 때?', 'answers': [{'text': '일어나야 할 시간에 딱 하나 맞춘다.', 'type': 'J'}, {'text': '5분 간격으로 여러 개 맞춰둔다.', 'type': 'P'}]},
    {'questionText': '당신에게 "즉흥적이다"라는 말은?', 'answers': [{'text': '불안하고 체계적이지 못하다는 뜻', 'type': 'J'}, {'text': '유연하고 자유롭다는 뜻', 'type': 'P'}]},
  ],
  // --- 세트 8 (신규) ---
  [
    // E/I
    {'questionText': '오랜만에 동창회에 나간다면?', 'answers': [{'text': '내가 먼저 연락해서 모임을 주선한다.', 'type': 'E'}, {'text': '누가 부르면 마지못해 나간다.', 'type': 'I'}]},
    {'questionText': '당신이 선호하는 운동은?', 'answers': [{'text': '축구, 농구 같은 팀 스포츠', 'type': 'E'}, {'text': '요가, 헬스, 조깅 같은 개인 운동', 'type': 'I'}]},
    {'questionText': '발표 수업 시간, 선생님이 지원자를 찾을 때?', 'answers': [{'text': '자신 있게 손을 든다.', 'type': 'E'}, {'text': '눈을 피하며 시선을 깐다.', 'type': 'I'}]},
    {'questionText': '당신은 자신의 감정을?', 'answers': [{'text': '얼굴에 다 드러나서 숨길 수 없다.', 'type': 'E'}, {'text': '속으로 삭혀서 남들은 잘 모른다.', 'type': 'I'}]},
    {'questionText': '버스 옆자리에 누군가 앉으면?', 'answers': [{'text': '혹시 아는 사람인지 슬쩍 본다.', 'type': 'E'}, {'text': '가방으로 바리케이드를 치고 창밖만 본다.', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 더 좋아하는 수업 방식은?', 'answers': [{'text': '실습 위주의 체험형 수업', 'type': 'S'}, {'text': '토론과 이론 위주의 수업', 'type': 'N'}]},
    {'questionText': '비행기를 탔을 때 드는 생각은?', 'answers': [{'text': '기내식 언제 나오지? 영화 뭐 보지?', 'type': 'S'}, {'text': '비행기가 추락해서 무인도에 떨어지면?', 'type': 'N'}]},
    {'questionText': '사과를 보면 떠오르는 것은?', 'answers': [{'text': '빨갛다, 맛있다, 둥글다.', 'type': 'S'}, {'text': '백설공주, 뉴턴, 아이폰, 윌리엄 텔.', 'type': 'N'}]},
    {'questionText': '당신은 꿈(수면 중)을 꾸면?', 'answers': [{'text': '잘 안 꾸거나 기억이 안 난다.', 'type': 'S'}, {'text': '판타지 영화처럼 생생하고 스펙터클하다.', 'type': 'N'}]},
    {'questionText': '친구가 뜬구름 잡는 소리를 하면?', 'answers': [{'text': '"그래서 결론이 뭐야?"', 'type': 'S'}, {'text': '같이 맞장구치며 상상의 나래를 펼친다.', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 차 사고 났다고 전화하면?', 'answers': [{'text': '"보험 불렀어? 사진 찍어놨어?"', 'type': 'T'}, {'text': '"몸은 괜찮아? 안 다쳤어?"', 'type': 'F'}]},
    {'questionText': '당신이 화를 내는 이유는?', 'answers': [{'text': '상식적으로 이해가 안 되는 행동을 해서', 'type': 'T'}, {'text': '내 마음을 몰라주고 무시해서', 'type': 'F'}]},
    {'questionText': '당신에게 사랑이란?', 'answers': [{'text': '서로에게 도움이 되는 신뢰 관계', 'type': 'T'}, {'text': '운명적이고 낭만적인 감정의 교류', 'type': 'F'}]},
    {'questionText': '누군가를 위로해 줄 때?', 'answers': [{'text': '해결책을 제시해주는 게 진짜 위로다.', 'type': 'T'}, {'text': '공감해주고 들어주는 게 진짜 위로다.', 'type': 'F'}]},
    {'questionText': '회사에서 해고 통보를 해야 한다면?', 'answers': [{'text': '회사의 사정과 이유를 객관적으로 전달한다.', 'type': 'T'}, {'text': '최대한 미안해하며 힘들게 말을 꺼낸다.', 'type': 'F'}]},
    // J/P
    {'questionText': '당신의 카톡 읽지 않음 숫자는?', 'answers': [{'text': '0 (보는 즉시 확인하고 답장한다)', 'type': 'J'}, {'text': '300+ (안 읽씹, 읽씹이 일상이다)', 'type': 'P'}]},
    {'questionText': '게임을 할 때 당신은?', 'answers': [{'text': '공략법을 먼저 찾아보고 효율적으로 한다.', 'type': 'J'}, {'text': '일단 부딪혀보며 몸으로 익힌다.', 'type': 'P'}]},
    {'questionText': '당신에게 "계획대로 안 됐다"는 것은?', 'answers': [{'text': '실패했다는 뜻이다.', 'type': 'J'}, {'text': '다른 방법으로 하면 된다는 뜻이다.', 'type': 'P'}]},
    {'questionText': '과제 제출 기한이 2주 남았다면?', 'answers': [{'text': '오늘부터 자료 조사를 시작한다.', 'type': 'J'}, {'text': '아직 13일이나 남았네? 논다.', 'type': 'P'}]},
    {'questionText': '당신의 옷장은?', 'answers': [{'text': '종류별, 색깔별로 정리되어 있다.', 'type': 'J'}, {'text': '어디에 뭐가 있는지 나만 안다.', 'type': 'P'}]},
  ],
  // --- 세트 9 (신규) ---
  [
    // E/I
    {'questionText': '당신은 말이 끊기면?', 'answers': [{'text': '어색한 침묵을 못 견디고 아무 말이나 한다.', 'type': 'E'}, {'text': '침묵도 편안하게 즐긴다.', 'type': 'I'}]},
    {'questionText': '당신이 더 좋아하는 대화 방식은?', 'answers': [{'text': '여러 명이 시끌벅적하게 떠드는 것', 'type': 'E'}, {'text': '일대일로 깊은 이야기를 나누는 것', 'type': 'I'}]},
    {'questionText': '길에서 설문조사를 요청받으면?', 'answers': [{'text': '웃으면서 응해주거나 거절한다.', 'type': 'E'}, {'text': '못 들은 척 빠르게 지나간다.', 'type': 'I'}]},
    {'questionText': '당신의 목소리 크기는?', 'answers': [{'text': '통화할 때 주변 사람들이 다 쳐다본다.', 'type': 'E'}, {'text': '식당에서 종업원을 부를 때 잘 안 들린다.', 'type': 'I'}]},
    {'questionText': '당신은 친구를 사귈 때?', 'answers': [{'text': '내가 먼저 다가가서 번호를 딴다.', 'type': 'E'}, {'text': '상대방이 다가와 주길 기다린다.', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 더 선호하는 책 장르는?', 'answers': [{'text': '자기계발서, 에세이, 실용서', 'type': 'S'}, {'text': '판타지 소설, SF, 추리 소설', 'type': 'N'}]},
    {'questionText': '하늘을 볼 때 드는 생각은?', 'answers': [{'text': '구름이 꼈네, 비 오려나?', 'type': 'S'}, {'text': '저 구름은 강아지 모양이네, 귀엽다.', 'type': 'N'}]},
    {'questionText': '당신의 필기 스타일은?', 'answers': [{'text': '선생님 말씀을 토씨 하나 안 틀리고 적는다.', 'type': 'S'}, {'text': '중요한 키워드나 그림으로 요약한다.', 'type': 'N'}]},
    {'questionText': '당신에게 "전통"이란?', 'answers': [{'text': '지켜야 할 소중한 가치', 'type': 'S'}, {'text': '바꾸고 개선해야 할 구습', 'type': 'N'}]},
    {'questionText': '당신은 어떤 사람과 대화가 잘 통하나?', 'answers': [{'text': '현실적인 조언을 해주는 사람', 'type': 'S'}, {'text': '독특한 아이디어를 공유하는 사람', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 머리를 이상하게 자르고 왔다면?', 'answers': [{'text': '"좀 짧은데? 미용실 어디 갔어?" (사실대로)', 'type': 'T'}, {'text': '"귀엽다! 시원해 보이네~" (선의의 거짓말)', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '원칙과 규정 준수', 'type': 'T'}, {'text': '사람의 사정과 형편 고려', 'type': 'F'}]},
    {'questionText': '토론 프로그램 볼 때 당신은?', 'answers': [{'text': '논리적 허점을 분석하며 본다.', 'type': 'T'}, {'text': '참가자들의 감정에 이입하며 본다.', 'type': 'F'}]},
    {'questionText': '당신에게 "비판"이란?', 'answers': [{'text': '발전을 위한 쓴소리', 'type': 'T'}, {'text': '나에 대한 공격', 'type': 'F'}]},
    {'questionText': '친구가 힘든 일을 털어놓으며 울 때?', 'answers': [{'text': '(휴지를 주며) "그래서 어떻게 됐는데?"', 'type': 'T'}, {'text': '(같이 울며) "어떡해 ㅠㅠ 진짜 힘들었겠다"', 'type': 'F'}]},
    // J/P
    {'questionText': '여행지에서 맛집 줄이 너무 길다면?', 'answers': [{'text': '다른 플랜 B 식당으로 바로 이동한다.', 'type': 'J'}, {'text': '기다리면서 주변 구경하거나 아무 데나 들어간다.', 'type': 'P'}]},
    {'questionText': '마트에 장 보러 갈 때?', 'answers': [{'text': '살 것만 딱 사서 나온다.', 'type': 'J'}, {'text': '시식 코너 돌고 1+1 행사 상품을 충동구매한다.', 'type': 'P'}]},
    {'questionText': '당신은 일을 할 때 순서는?', 'answers': [{'text': '중요한 것부터 우선순위를 정해 처리한다.', 'type': 'J'}, {'text': '손에 잡히는 것부터 하거나 쉬운 것부터 한다.', 'type': 'P'}]},
    {'questionText': '당신의 가방 속은?', 'answers': [{'text': '파우치 등으로 깔끔하게 정리되어 있다.', 'type': 'J'}, {'text': '영수증, 쓰레기, 이어폰이 엉켜 있다.', 'type': 'P'}]},
    {'questionText': '당신은 약속을 잡을 때?', 'answers': [{'text': '며칠 전부터 시간과 장소를 확정한다.', 'type': 'J'}, {'text': '"내일 시간 돼? 밥 먹자" 당일에 잡는다.', 'type': 'P'}]},
  ],
  // --- 세트 10 (신규) ---
  [
    // E/I
    {'questionText': '팀플 조장을 뽑아야 한다면?', 'answers': [{'text': '아무도 안 하면 내가 한다.', 'type': 'E'}, {'text': '절대 눈도 안 마주친다.', 'type': 'I'}]},
    {'questionText': '당신은 혼밥(혼자 밥 먹기)을?', 'answers': [{'text': '어색하고 싫다. 같이 먹는 게 좋다.', 'type': 'E'}, {'text': '편하고 좋다. 메뉴도 내 맘대로.', 'type': 'I'}]},
    {'questionText': '당신이 생각하는 이상적인 주말은?', 'answers': [{'text': '페스티벌이나 놀이공원 가기', 'type': 'E'}, {'text': '집에서 넷플릭스 정주행하기', 'type': 'I'}]},
    {'questionText': '당신은 화가 나면?', 'answers': [{'text': '바로바로 말해서 푼다.', 'type': 'E'}, {'text': '입을 닫고 혼자 삭힌다.', 'type': 'I'}]},
    {'questionText': '당신에게 "침묵"이란?', 'answers': [{'text': '견딜 수 없는 고통', 'type': 'E'}, {'text': '평화로운 안식', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 요리를 망친 이유는?', 'answers': [{'text': '불 조절 실패 또는 재료 부족', 'type': 'S'}, {'text': '새로운 시도를 해보다가', 'type': 'N'}]},
    {'questionText': '영화를 보고 나서 친구와 나누는 대화는?', 'answers': [{'text': '"그 배우 연기 잘하더라."', 'type': 'S'}, {'text': '"만약 주인공이 안 죽었으면 어땠을까?"', 'type': 'N'}]},
    {'questionText': '당신이 더 좋아하는 질문은?', 'answers': [{'text': '"오늘 뭐 했어?"', 'type': 'S'}, {'text': '"너는 어떤 사람이 되고 싶어?"', 'type': 'N'}]},
    {'questionText': '당신은 길을 걸을 때?', 'answers': [{'text': '간판이나 사람들을 구경한다.', 'type': 'S'}, {'text': '딴생각하다가 목적지를 지나친 적이 있다.', 'type': 'N'}]},
    {'questionText': '당신에게 "숲"이란?', 'answers': [{'text': '나무와 풀이 많은 곳', 'type': 'S'}, {'text': '요정이 살 것 같은 신비로운 곳', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 뚱뚱해진 것 같지?"라고 물으면?', 'answers': [{'text': '"운동 좀 해야겠더라." (솔직)', 'type': 'T'}, {'text': '"아니야~ 보기 좋은데 왜 그래?" (빈말)', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '객관적인 사실', 'type': 'T'}, {'text': '사람의 감정', 'type': 'F'}]},
    {'questionText': '회의 중에 의견 충돌이 생기면?', 'answers': [{'text': '팩트를 기반으로 논리적으로 반박한다.', 'type': 'T'}, {'text': '상대방 기분이 상하지 않게 돌려 말한다.', 'type': 'F'}]},
    {'questionText': '당신은 어떤 사람에게 호감이 가나?', 'answers': [{'text': '일 잘하고 똑부러지는 사람', 'type': 'T'}, {'text': '다정하고 배려심 깊은 사람', 'type': 'F'}]},
    {'questionText': '당신이 사과를 하는 이유는?', 'answers': [{'text': '내가 잘못한 게 맞으니까', 'type': 'T'}, {'text': '관계가 틀어지는 게 싫어서', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 여행 짐을 언제 싸나?', 'answers': [{'text': '일주일 전부터 차근차근', 'type': 'J'}, {'text': '출발 전날 밤이나 당일 아침', 'type': 'P'}]},
    {'questionText': '당신의 핸드폰 배터리가 20% 남았다면?', 'answers': [{'text': '불안해서 충전기를 찾는다.', 'type': 'J'}, {'text': '아직 20%나 남았네 하고 쓴다.', 'type': 'P'}]},
    {'questionText': '당신은 계획을 세울 때?', 'answers': [{'text': '분 단위로 쪼개서 세운다.', 'type': 'J'}, {'text': '큰 틀만 잡아놓는다.', 'type': 'P'}]},
    {'questionText': '당신이 더 선호하는 업무 스타일은?', 'answers': [{'text': '체계적인 프로세스가 있는 업무', 'type': 'J'}, {'text': '자율성이 보장되는 업무', 'type': 'P'}]},
    {'questionText': '약속 장소가 갑자기 바뀌면?', 'answers': [{'text': '미리 알아본 동선이 꼬여서 짜증 난다.', 'type': 'J'}, {'text': '새로운 곳이라니 오히려 좋아!', 'type': 'P'}]},
  ],
  // --- 세트 11 (신규) ---
  [
    // E/I
    {'questionText': '당신은 처음 보는 사람과 눈이 마주치면?', 'answers': [{'text': '가볍게 목례하거나 미소 짓는다.', 'type': 'E'}, {'text': '황급히 눈을 피한다.', 'type': 'I'}]},
    {'questionText': '당신은 발표할 때?', 'answers': [{'text': '무대 체질이다. 시선을 즐긴다.', 'type': 'E'}, {'text': '심장이 터질 것 같고 목소리가 떨린다.', 'type': 'I'}]},
    {'questionText': '당신의 SNS 활동은?', 'answers': [{'text': '내 일상을 실시간으로 공유한다.', 'type': 'E'}, {'text': '눈팅만 하거나 비공개 계정이다.', 'type': 'I'}]},
    {'questionText': '당신은 고민이 생기면?', 'answers': [{'text': '여기저기 말하고 다니며 조언을 구한다.', 'type': 'E'}, {'text': '혼자 끙끙 앓으며 해결책을 찾는다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 파티를 선호하나?', 'answers': [{'text': '모르는 사람도 섞여 있는 스탠딩 파티', 'type': 'E'}, {'text': '친한 친구 몇 명만 모인 홈 파티', 'type': 'I'}]},
    // S/N
    {'questionText': '당신은 멍 때릴 때 주로?', 'answers': [{'text': '주변 사물을 관찰한다.', 'type': 'S'}, {'text': '현실에 없는 공상을 한다.', 'type': 'N'}]},
    {'questionText': '당신이 더 좋아하는 영화 결말은?', 'answers': [{'text': '모든 떡밥이 회수되는 깔끔한 결말', 'type': 'S'}, {'text': '여운이 남고 해석이 분분한 열린 결말', 'type': 'N'}]},
    {'questionText': '당신에게 "사과"란?', 'answers': [{'text': '과일, 빨간색, 맛있다.', 'type': 'S'}, {'text': '백설공주, 독, 유혹, 아이폰.', 'type': 'N'}]},
    {'questionText': '당신은 맛집을 찾을 때?', 'answers': [{'text': '평점과 후기를 꼼꼼히 본다.', 'type': 'S'}, {'text': '간판 느낌이나 촉으로 들어간다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 이야기를 더 좋아하나?', 'answers': [{'text': '실제 있었던 역사적 사건', 'type': 'S'}, {'text': '마법과 용이 나오는 판타지', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 너무 힘들어서 퇴사했어"라고 하면?', 'answers': [{'text': '"다음 계획은 있어? 실업급여는?"', 'type': 'T'}, {'text': '"그동안 진짜 고생 많았어. 맛있는 거 먹자."', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '능력과 성과', 'type': 'T'}, {'text': '노력과 과정', 'type': 'F'}]},
    {'questionText': '당신은 논쟁에서 이기면?', 'answers': [{'text': '짜릿하고 기분이 좋다.', 'type': 'T'}, {'text': '상대방이 상처받았을까 봐 찜찜하다.', 'type': 'F'}]},
    {'questionText': '당신이 위로하는 방식은?', 'answers': [{'text': '현실적인 조언을 해준다.', 'type': 'T'}, {'text': '등을 토닥여주며 공감해준다.', 'type': 'F'}]},
    {'questionText': '당신은 어떤 사람이라는 말을 듣고 싶나?', 'answers': [{'text': '유능하고 똑똑한 사람', 'type': 'T'}, {'text': '따뜻하고 착한 사람', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 숙제를 언제 하나?', 'answers': [{'text': '받자마자 바로 시작한다.', 'type': 'J'}, {'text': '제출 직전까지 미룬다.', 'type': 'P'}]},
    {'questionText': '당신은 약속 시간에 늦는 친구를 보면?', 'answers': [{'text': '시간 약속 안 지키는 거 정말 싫다.', 'type': 'J'}, {'text': '그럴 수도 있지, 나도 늦을 때 있는데.', 'type': 'P'}]},
    {'questionText': '당신은 어떤 여행 스타일인가?', 'answers': [{'text': '엑셀로 분 단위 계획표를 짠다.', 'type': 'J'}, {'text': '발길 닿는 대로 간다.', 'type': 'P'}]},
    {'questionText': '당신의 방 정리는?', 'answers': [{'text': '항상 깨끗하게 유지한다.', 'type': 'J'}, {'text': '발 디딜 틈만 있으면 된다.', 'type': 'P'}]},
    {'questionText': '당신에게 "즉흥 여행"이란?', 'answers': [{'text': '불안하고 준비 안 된 여행', 'type': 'J'}, {'text': '설레고 낭만적인 여행', 'type': 'P'}]},
  ],
  // --- 세트 12 (신규) ---
  [
    // E/I
    {'questionText': '당신은 낯선 사람과 엘리베이터에 갇히면?', 'answers': [{'text': '말을 걸며 불안함을 달랜다.', 'type': 'E'}, {'text': '구조될 때까지 조용히 기다린다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 자리를 선호하나?', 'answers': [{'text': '사람들이 많이 다니는 창가나 중앙', 'type': 'E'}, {'text': '구석진 조용한 자리', 'type': 'I'}]},
    {'questionText': '당신은 기분이 좋을 때?', 'answers': [{'text': '노래를 흥얼거리거나 춤을 춘다.', 'type': 'E'}, {'text': '혼자 조용히 미소 짓는다.', 'type': 'I'}]},
    {'questionText': '당신은 사람 이름을 잘 기억하나?', 'answers': [{'text': '한번 들으면 잘 기억한다.', 'type': 'E'}, {'text': '잘 기억 못 해서 다시 물어본다.', 'type': 'I'}]},
    {'questionText': '당신은 주말에 약속이 없으면?', 'answers': [{'text': '누구라도 불러내서 논다.', 'type': 'E'}, {'text': '집에서 밀린 잠을 자거나 넷플릭스를 본다.', 'type': 'I'}]},
    // S/N
    {'questionText': '당신이 요리를 할 때?', 'answers': [{'text': '계량컵과 저울을 사용한다.', 'type': 'S'}, {'text': '눈대중으로 대충 넣는다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 꿈을 꾸나?', 'answers': [{'text': '현실적인 내용의 꿈', 'type': 'S'}, {'text': '개연성 없는 판타지 꿈', 'type': 'N'}]},
    {'questionText': '당신은 숲을 볼 때?', 'answers': [{'text': '나무의 종류나 잎의 색깔을 본다.', 'type': 'S'}, {'text': '숲의 전체적인 분위기나 느낌을 본다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 설명서를 선호하나?', 'answers': [{'text': '단계별로 자세히 적힌 글', 'type': 'S'}, {'text': '완성된 모습이 그려진 그림', 'type': 'N'}]},
    {'questionText': '당신은 "사랑" 하면 떠오르는 것은?', 'answers': [{'text': '심장 박동, 호르몬, 데이트', 'type': 'S'}, {'text': '운명, 영원, 붉은 실', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 시험 100점 맞았어!"라고 하면?', 'answers': [{'text': '"오, 이번 시험 쉬웠나 보네?"', 'type': 'T'}, {'text': '"와 대박! 진짜 고생했어, 축하해!"', 'type': 'F'}]},
    {'questionText': '당신이 화해하는 방식은?', 'answers': [{'text': '잘못된 부분을 따져보고 해결책을 찾는다.', 'type': 'T'}, {'text': '서운했던 감정을 이야기하고 푼다.', 'type': 'F'}]},
    {'questionText': '당신은 어떤 조언을 선호하나?', 'answers': [{'text': '현실적이고 직설적인 조언', 'type': 'T'}, {'text': '따뜻하고 감성적인 조언', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '정의와 진실', 'type': 'T'}, {'text': '관계와 평화', 'type': 'F'}]},
    {'questionText': '당신은 어떤 사람과 일하고 싶나?', 'answers': [{'text': '일 잘하지만 성격 까칠한 사람', 'type': 'T'}, {'text': '일은 좀 못해도 성격 좋은 사람', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 시험 공부를 언제 시작하나?', 'answers': [{'text': '시험 한 달 전부터 계획적으로', 'type': 'J'}, {'text': '시험 전날 벼락치기', 'type': 'P'}]},
    {'questionText': '당신은 약속을 잡을 때?', 'answers': [{'text': '몇 시에 만나서 뭐 할지 다 정한다.', 'type': 'J'}, {'text': '일단 만나서 생각한다.', 'type': 'P'}]},
    {'questionText': '당신의 책상은?', 'answers': [{'text': '필요한 물건만 딱딱 정리되어 있다.', 'type': 'J'}, {'text': '온갖 잡동사니가 쌓여 있다.', 'type': 'P'}]},
    {'questionText': '당신은 영화관에 갈 때?', 'answers': [{'text': '미리 예매하고 시간 맞춰 간다.', 'type': 'J'}, {'text': '가서 보고 싶은 거 예매한다.', 'type': 'P'}]},
    {'questionText': '당신에게 "계획"이란?', 'answers': [{'text': '지켜야 하는 약속', 'type': 'J'}, {'text': '그냥 적어보는 낙서', 'type': 'P'}]},
  ],
  // --- 세트 13 (신규) ---
  [
    // E/I
    {'questionText': '당신은 버스에서 아는 사람을 만나면?', 'answers': [{'text': '반갑게 인사하고 옆에 앉아 수다 떤다.', 'type': 'E'}, {'text': '못 본 척하거나 가볍게 목례만 한다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 분위기를 좋아하나?', 'answers': [{'text': '시끌벅적하고 활기찬 분위기', 'type': 'E'}, {'text': '차분하고 조용한 분위기', 'type': 'I'}]},
    {'questionText': '당신은 친구가 "심심해"라고 하면?', 'answers': [{'text': '"나랑 놀자! 나가자!"', 'type': 'E'}, {'text': '"집에서 영화나 봐."', 'type': 'I'}]},
    {'questionText': '당신은 발표 수업을 좋아하나?', 'answers': [{'text': '좋아한다. 내 의견을 말하는 게 즐겁다.', 'type': 'E'}, {'text': '싫어한다. 주목받는 게 부담스럽다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 사람과 친해지기 쉽나?', 'answers': [{'text': '말 많고 활발한 사람', 'type': 'E'}, {'text': '조용하고 차분한 사람', 'type': 'I'}]},
    // S/N
    {'questionText': '당신은 어떤 영화를 좋아하나?', 'answers': [{'text': '액션, 스릴러, 로맨틱 코미디', 'type': 'S'}, {'text': 'SF, 판타지, 미스터리', 'type': 'N'}]},
    {'questionText': '당신은 길을 걸을 때?', 'answers': [{'text': '땅을 보거나 앞만 보고 걷는다.', 'type': 'S'}, {'text': '하늘을 보거나 두리번거리며 걷는다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 선물을 좋아하나?', 'answers': [{'text': '실용적인 물건 (옷, 화장품, 전자기기)', 'type': 'S'}, {'text': '의미 있는 물건 (편지, 수제 앨범, 꽃)', 'type': 'N'}]},
    {'questionText': '당신은 어떤 대화를 좋아하나?', 'answers': [{'text': '연예인, 맛집, 일상 이야기', 'type': 'S'}, {'text': '철학, 우주, 미래 이야기', 'type': 'N'}]},
    {'questionText': '당신에게 "죽음"이란?', 'answers': [{'text': '심장이 멈추고 뇌 기능이 정지하는 것', 'type': 'S'}, {'text': '새로운 세계로 떠나는 여행', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 차였어"라고 하면?', 'answers': [{'text': '"왜? 무슨 일 있었어?" (이유 묻기)', 'type': 'T'}, {'text': '"헐... 괜찮아? 많이 힘들지?" (공감하기)', 'type': 'F'}]},
    {'questionText': '당신이 더 싫어하는 사람은?', 'answers': [{'text': '무능력하고 게으른 사람', 'type': 'T'}, {'text': '이기적이고 배려 없는 사람', 'type': 'F'}]},
    {'questionText': '당신은 어떤 칭찬을 듣고 싶나?', 'answers': [{'text': '"너 일 진짜 잘한다."', 'type': 'T'}, {'text': '"너랑 있으면 마음이 편해."', 'type': 'F'}]},
    {'questionText': '당신은 친구의 고민을 들을 때?', 'answers': [{'text': '해결책을 찾아주려고 노력한다.', 'type': 'T'}, {'text': '감정에 공감해주려고 노력한다.', 'type': 'F'}]},
    {'questionText': '당신에게 "정직"이란?', 'answers': [{'text': '사실 그대로를 말하는 것', 'type': 'T'}, {'text': '상대방에게 상처 주지 않는 선에서 말하는 것', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 알람을 끄고?', 'answers': [{'text': '바로 일어난다.', 'type': 'J'}, {'text': '5분만 더... 하고 다시 잔다.', 'type': 'P'}]},
    {'questionText': '당신은 맛집 웨이팅을?', 'answers': [{'text': '1시간이라도 기다려서 먹는다.', 'type': 'J'}, {'text': '기다리기 싫어서 옆 가게 간다.', 'type': 'P'}]},
    {'questionText': '당신은 데이트 코스를?', 'answers': [{'text': 'A부터 Z까지 완벽하게 짜온다.', 'type': 'J'}, {'text': '만나서 끌리는 대로 간다.', 'type': 'P'}]},
    {'questionText': '당신은 옷을 입을 때?', 'answers': [{'text': '전날 밤에 미리 코디해 둔다.', 'type': 'J'}, {'text': '아침에 눈에 보이는 대로 입는다.', 'type': 'P'}]},
    {'questionText': '당신은 계획이 틀어지면?', 'answers': [{'text': '화나고 짜증 난다.', 'type': 'J'}, {'text': '그럴 수도 있지 하고 넘긴다.', 'type': 'P'}]},
  ],
  // --- 세트 14 (신규) ---
  [
    // E/I
    {'questionText': '당신은 어떤 모임을 좋아하나?', 'answers': [{'text': '여러 명이 시끌벅적하게 노는 모임', 'type': 'E'}, {'text': '소수 정예로 조용하게 대화하는 모임', 'type': 'I'}]},
    {'questionText': '당신은 처음 본 사람에게?', 'answers': [{'text': '먼저 말을 걸고 친해지려고 한다.', 'type': 'E'}, {'text': '말을 걸어올 때까지 기다린다.', 'type': 'I'}]},
    {'questionText': '당신은 주말에 집에 혼자 있으면?', 'answers': [{'text': '심심해서 친구에게 연락한다.', 'type': 'E'}, {'text': '밀린 드라마를 보며 행복해한다.', 'type': 'I'}]},
    {'questionText': '당신은 발표를 마치고 나면?', 'answers': [{'text': '뿌듯하고 기분이 좋다.', 'type': 'E'}, {'text': '기가 빨려서 집에 가고 싶다.', 'type': 'I'}]},
    {'questionText': '당신은 어떤 친구가 더 많은가?', 'answers': [{'text': '얕고 넓은 친구 관계', 'type': 'E'}, {'text': '좁고 깊은 친구 관계', 'type': 'I'}]},
    // S/N
    {'questionText': '당신은 노래를 들을 때?', 'answers': [{'text': '멜로디가 좋으면 듣는다.', 'type': 'S'}, {'text': '가사가 좋으면 듣는다.', 'type': 'N'}]},
    {'questionText': '당신은 어떤 영화를 좋아하나?', 'answers': [{'text': '현실적인 사랑 이야기', 'type': 'S'}, {'text': '시간 여행이나 초능력 이야기', 'type': 'N'}]},
    {'questionText': '당신은 "사과" 하면?', 'answers': [{'text': '빨갛다, 맛있다.', 'type': 'S'}, {'text': '백설공주, 아이폰, 뉴턴.', 'type': 'N'}]},
    {'questionText': '당신은 길을 설명할 때?', 'answers': [{'text': '"큰 마트 끼고 돌아서 100m 직진해."', 'type': 'S'}, {'text': '"저쪽으로 쭉 가다 보면 나와."', 'type': 'N'}]},
    {'questionText': '당신에게 "미래"란?', 'answers': [{'text': '내일, 다음 주, 다음 달.', 'type': 'S'}, {'text': '먼 훗날, 나의 꿈, 이상향.', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 "나 너무 우울해"라고 하면?', 'answers': [{'text': '"왜? 무슨 일 있었어?"', 'type': 'T'}, {'text': '"헐... ㅠㅠ 맛있는 거 사줄까?"', 'type': 'F'}]},
    {'questionText': '당신이 더 중요하게 생각하는 것은?', 'answers': [{'text': '공정함과 원칙', 'type': 'T'}, {'text': '이해와 배려', 'type': 'F'}]},
    {'questionText': '당신은 친구가 잘못된 행동을 하면?', 'answers': [{'text': '따끔하게 충고해준다.', 'type': 'T'}, {'text': '상처받을까 봐 돌려 말한다.', 'type': 'F'}]},
    {'questionText': '당신은 어떤 리더를 좋아하나?', 'answers': [{'text': '능력 있고 결단력 있는 리더', 'type': 'T'}, {'text': '팀원을 잘 챙겨주는 따뜻한 리더', 'type': 'F'}]},
    {'questionText': '당신에게 "성공"이란?', 'answers': [{'text': '돈 많이 벌고 높은 지위에 오르는 것', 'type': 'T'}, {'text': '사랑하는 사람들과 행복하게 사는 것', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 여행 계획을?', 'answers': [{'text': '엑셀로 정리해서 짠다.', 'type': 'J'}, {'text': '대충 어디 갈지만 정한다.', 'type': 'P'}]},
    {'questionText': '당신은 약속 시간에?', 'answers': [{'text': '항상 10분 전에 도착한다.', 'type': 'J'}, {'text': '정각에 도착하거나 5분 늦는다.', 'type': 'P'}]},
    {'questionText': '당신의 책상은?', 'answers': [{'text': '먼지 하나 없이 깨끗하다.', 'type': 'J'}, {'text': '물건들이 어지럽게 놓여 있다.', 'type': 'P'}]},
    {'questionText': '당신은 과제를 언제 하나?', 'answers': [{'text': '미리미리 해둔다.', 'type': 'J'}, {'text': '마감 직전에 몰아서 한다.', 'type': 'P'}]},
    {'questionText': '당신은 계획이 바뀌면?', 'answers': [{'text': '스트레스 받는다.', 'type': 'J'}, {'text': '유연하게 대처한다.', 'type': 'P'}]},
  ],
  // --- 세트 15 (신규) ---
  [
    // E/I
    {'questionText': '당신은 어떤 사람인가?', 'answers': [{'text': '에너지가 넘치고 활발한 사람', 'type': 'E'}, {'text': '조용하고 차분한 사람', 'type': 'I'}]},
    {'questionText': '당신은 스트레스를 받으면?', 'answers': [{'text': '친구들을 만나서 푼다.', 'type': 'E'}, {'text': '혼자 조용히 쉰다.', 'type': 'I'}]},
    {'questionText': '당신은 새로운 환경에 가면?', 'answers': [{'text': '금방 적응하고 친구를 사귄다.', 'type': 'E'}, {'text': '적응하는 데 시간이 걸린다.', 'type': 'I'}]},
    {'questionText': '당신은 대화할 때?', 'answers': [{'text': '주로 말하는 편이다.', 'type': 'E'}, {'text': '주로 듣는 편이다.', 'type': 'I'}]},
    {'questionText': '당신은 혼자 밥 먹는 것을?', 'answers': [{'text': '싫어한다.', 'type': 'E'}, {'text': '좋아한다.', 'type': 'I'}]},
    // S/N
    {'questionText': '당신은 어떤 스타일의 영화를 좋아하나?', 'answers': [{'text': '현실적인 스토리', 'type': 'S'}, {'text': '판타지 스토리', 'type': 'N'}]},
    {'questionText': '당신은 숲을 볼 때?', 'answers': [{'text': '나무를 본다.', 'type': 'S'}, {'text': '숲 전체를 본다.', 'type': 'N'}]},
    {'questionText': '당신에게 "사과"란?', 'answers': [{'text': '맛있는 과일', 'type': 'S'}, {'text': '다양한 상징', 'type': 'N'}]},
    {'questionText': '당신은 설명서를?', 'answers': [{'text': '꼼꼼히 읽는다.', 'type': 'S'}, {'text': '대충 본다.', 'type': 'N'}]},
    {'questionText': '당신은 미래를 생각하면?', 'answers': [{'text': '현실적인 계획을 세운다.', 'type': 'S'}, {'text': '다양한 상상을 한다.', 'type': 'N'}]},
    // T/F
    {'questionText': '친구가 고민을 말하면?', 'answers': [{'text': '해결책을 준다.', 'type': 'T'}, {'text': '공감해 준다.', 'type': 'F'}]},
    {'questionText': '당신은 어떤 칭찬이 더 좋은가?', 'answers': [{'text': '능력에 대한 칭찬', 'type': 'T'}, {'text': '성격에 대한 칭찬', 'type': 'F'}]},
    {'questionText': '당신은 싸울 때?', 'answers': [{'text': '논리적으로 따진다.', 'type': 'T'}, {'text': '감정에 호소한다.', 'type': 'F'}]},
    {'questionText': '당신에게 더 중요한 것은?', 'answers': [{'text': '진실', 'type': 'T'}, {'text': '화합', 'type': 'F'}]},
    {'questionText': '당신은 결정을 내릴 때?', 'answers': [{'text': '이성적으로 판단한다.', 'type': 'T'}, {'text': '감정적으로 판단한다.', 'type': 'F'}]},
    // J/P
    {'questionText': '당신은 여행 갈 때?', 'answers': [{'text': '계획을 세운다.', 'type': 'J'}, {'text': '그냥 간다.', 'type': 'P'}]},
    {'questionText': '당신은 방 정리를?', 'answers': [{'text': '자주 한다.', 'type': 'J'}, {'text': '가끔 한다.', 'type': 'P'}]},
    {'questionText': '당신은 약속 시간을?', 'answers': [{'text': '철저히 지킨다.', 'type': 'J'}, {'text': '가끔 늦는다.', 'type': 'P'}]},
    {'questionText': '당신은 일을 할 때?', 'answers': [{'text': '미리미리 한다.', 'type': 'J'}, {'text': '닥쳐서 한다.', 'type': 'P'}]},
    {'questionText': '당신은 계획이 틀어지면?', 'answers': [{'text': '당황한다.', 'type': 'J'}, {'text': '즐긴다.', 'type': 'P'}]},
  ],
];

// 데이터 구조 변경: 추천 직업(jobs)과 잘 맞는 유형(compatibility) 추가
const Map<String, Map<String, Object>> mbtiDescriptions = {
  'ISTJ': {
    'simple': '청렴결백한 논리주의자, 소금형',
    'detail': '현실적이고 책임감이 강하며, 한번 시작한 일은 끝까지 해내는 신뢰할 수 있는 사람입니다. 전통과 질서를 중시하며, 세부적인 사항까지 꼼꼼하게 챙기는 경향이 있습니다.',
    'jobs': ['회계사', '법률가', '공무원'],
    'compatibility': ['ESFP', 'ESTP']
  },
  'ISFJ': {
    'simple': '용감한 수호자, 권력형',
    'detail': '따뜻하고 헌신적이며, 주변 사람들을 챙기는 데서 큰 기쁨을 느낍니다. 섬세하고 기억력이 좋아 다른 사람이 놓치는 디테일까지 신경 써주는 배려심 깊은 유형입니다.',
    'jobs': ['간호사', '교사', '사회 복지사'],
    'compatibility': ['ESFP', 'ESTP']
  },
  'INFJ': {
    'simple': '선의의 옹호자, 예언자형',
    'detail': '깊은 통찰력과 직관력을 가지고 있으며, 다른 사람의 감정을 잘 이해하고 공감합니다. 이상주의적인 성향으로 더 나은 세상을 만드는 데 기여하고 싶어합니다.',
    'jobs': ['상담사', '작가', '예술가'],
    'compatibility': ['ENFP', 'ENTP']
  },
  'INTJ': {
    'simple': '용의주도한 전략가, 과학자형',
    'detail': '전략적인 사고와 뛰어난 분석력을 바탕으로 복잡한 문제를 해결하는 데 능숙합니다. 독립적이며, 자신의 아이디어와 비전에 대한 강한 확신을 가지고 있습니다.',
    'jobs': ['과학자', '엔지니어', '전략가'],
    'compatibility': ['ENFP', 'ENTP']
  },
  'ISTP': {
    'simple': '만능 재주꾼, 백과사전형',
    'detail': '논리적이고 실용적이며, 손으로 무언가를 만들거나 문제를 해결하는 것을 즐깁니다. 위기 상황에서 뛰어난 적응력과 침착함을 발휘하는 경향이 있습니다.',
    'jobs': ['엔지니어', '파일럿', '운동선수'],
    'compatibility': ['ESFJ', 'ESTJ']
  },
  'ISFP': {
    'simple': '호기심 많은 예술가, 성인군자형',
    'detail': '겸손하고 온화하며, 삶의 현재를 즐기는 낭만적인 유형입니다. 미적 감각이 뛰어나며, 다른 사람에게 친절하고 따뜻한 마음을 가지고 있습니다.',
    'jobs': ['예술가', '디자이너', '수의사'],
    'compatibility': ['ENFJ', 'ESFJ', 'ESTJ']
  },
  'INFP': {
    'simple': '열정적인 중재자, 잔다르크형',
    'detail': '따뜻하고 상상력이 풍부하며, 자신의 가치관과 신념을 중요하게 생각합니다. 다른 사람의 가능성을 믿고 지지해주는 이상주의적인 성향을 가집니다.',
    'jobs': ['작가', '심리학자', '그래픽 디자이너'],
    'compatibility': ['ENFJ', 'ENTJ']
  },
  'INTP': {
    'simple': '논리적인 사색가, 아이디어형',
    'detail': '지적 호기심이 강하고 논리적인 분석을 즐기는 유형입니다. 복잡한 이론이나 아이디어에 깊이 빠져들며, 독창적인 해결책을 찾아내는 데 뛰어납니다.',
    'jobs': ['프로그래머', '교수', '연구원'],
    'compatibility': ['ENTJ', 'ESTJ']
  },
  'ESTP': {
    'simple': '모험을 즐기는 사업가, 활동가형',
    'detail': '사교적이고 에너지가 넘치며, 스릴과 새로운 경험을 추구합니다. 뛰어난 관찰력과 현실 감각으로 상황을 빠르게 파악하고 행동으로 옮기는 데 능숙합니다.',
    'jobs': ['사업가', '마케터', '경찰관'],
    'compatibility': ['ISFJ', 'ISTJ']
  },
  'ESFP': {
    'simple': '자유로운 영혼의 연예인, 사교형',
    'detail': '사람들과 어울리는 것을 좋아하고, 분위기를 즐겁게 만드는 타고난 매력을 가졌습니다. 현재를 즐기며, 긍정적이고 낙천적인 태도로 주변에 활력을 줍니다.',
    'jobs': ['배우', '이벤트 플래너', '영업 전문가'],
    'compatibility': ['ISFJ', 'ISTJ']
  },
  'ENFP': {
    'simple': '재기발랄한 활동가, 스파크형',
    'detail': '열정적이고 상상력이 풍부하며, 새로운 가능성을 탐험하는 것을 좋아합니다. 사람들에게 영감을 주고 긍정적인 에너지를 전파하는 매력적인 유형입니다.',
    'jobs': ['카피라이터', '저널리스트', '상담사'],
    'compatibility': ['INFJ', 'INTJ']
  },
  'ENTP': {
    'simple': '뜨거운 논쟁을 즐기는 변론가, 발명가형',
    'detail': '지적인 도전을 즐기고, 기존의 방식에 의문을 제기하며 새로운 아이디어를 탐색하는 것을 좋아합니다. 재치 있고 빠른 두뇌 회전으로 논쟁을 즐기는 경향이 있습니다.',
    'jobs': ['발명가', '변호사', '컨설턴트'],
    'compatibility': ['INFJ', 'INTJ']
  },
  'ESTJ': {
    'simple': '엄격한 관리자, 사업가형',
    'detail': '체계적이고 현실적인 감각으로 일을 조직하고 관리하는 데 뛰어난 능력을 보입니다. 명확한 규칙과 절차를 중시하며, 책임감이 강해 믿고 일을 맡길 수 있습니다.',
    'jobs': ['관리자', '감독', '판사'],
    'compatibility': ['INTP', 'ISFP', 'ISTP']
  },
  'ESFJ': {
    'simple': '사교적인 외교관, 친선도모형',
    'detail': '주변 사람들에게 관심이 많고, 다른 사람을 돕는 것을 좋아합니다. 사회적인 조화를 중요하게 생각하며, 따뜻하고 친절한 성격으로 인기가 많습니다.',
    'jobs': ['교사', '인사 관리자', '상담사'],
    'compatibility': ['ISFP', 'ISTP']
  },
  'ENFJ': {
    'simple': '정의로운 사회운동가, 언변능숙형',
    'detail': '사람들에게 깊은 공감 능력을 발휘하며, 그들의 성장을 돕는 데서 보람을 느낍니다. 타고난 리더십과 카리스마로 사람들을 이끌고 긍정적인 변화를 만들어냅니다.',
    'jobs': ['정치인', '교사', 'HR 전문가'],
    'compatibility': ['INFP', 'ISFP']
  },
  'ENTJ': {
    'simple': '대담한 통솔자, 지도자형',
    'detail': '타고난 리더십과 비전을 바탕으로 목표를 설정하고 달성하는 데 뛰어납니다. 전략적이고 결단력이 있으며, 도전을 두려워하지 않는 자신감 넘치는 유형입니다.',
    'jobs': ['CEO', '경영 컨설턴트', '변호사'],
    'compatibility': ['INFP', 'INTP']
  },
};