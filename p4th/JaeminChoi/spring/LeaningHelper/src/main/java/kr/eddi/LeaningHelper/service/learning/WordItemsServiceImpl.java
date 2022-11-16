package kr.eddi.LeaningHelper.service.learning;

import kr.eddi.LeaningHelper.entity.learning.words.WordItems;
import kr.eddi.LeaningHelper.entity.learning.words.WordsDegree;
import kr.eddi.LeaningHelper.respones.learning.WordResponseForm;
import kr.eddi.LeaningHelper.repository.learning.WordItemsRepository;
import kr.eddi.LeaningHelper.repository.learning.WordsDegreeRepository;
import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class WordItemsServiceImpl implements WordItemsService{

    @Autowired
    WordItemsRepository wordItemsRepository;
    WordsDegreeRepository wordsDegreeRepository;

    // 해당 차수에 원하는 단어 입력
    @Override
    public boolean wordItemRegister(WordItemsRequest wordItemsRequest) {

        try {
            Optional<WordsDegree> maybeWordsDegree = wordsDegreeRepository.findAllDegreeByDegree(wordItemsRequest.getDegree());
            if(maybeWordsDegree == null){
                WordsDegree createDegree = WordsDegree.builder().
                        Degree(wordItemsRequest.getDegree())
                        .build();
                wordsDegreeRepository.save(createDegree);
                Optional<WordsDegree> getWordsDegree = wordsDegreeRepository.findById(wordItemsRequest.getDegree());
                WordsDegree wordsDegree = getWordsDegree.get();
                final WordItems toWordItems = wordItemsRequest.toWordItems();
                WordItems wordItems = WordItems.builder()
                        .word(toWordItems.getWord())
                        .meaning(toWordItems.getMeaning())
                        .wordsDegree(wordsDegree)
                        .build();

                wordItemsRepository.save(wordItems);
                return true;
            }
            WordsDegree wordsDegree = maybeWordsDegree.get();

            final WordItems toWordItems = wordItemsRequest.toWordItems();
            WordItems wordItems = WordItems.builder()
                    .word(toWordItems.getWord())
                    .meaning(toWordItems.getMeaning())
                    .wordsDegree(wordsDegree)
                    .build();

            wordItemsRepository.save(wordItems);
            return true;
        }catch (Exception e){
            System.out.println("오류 발생! : " + e );
            return false;
        }


    }

    // 해당 차수 단어 반환
    @Override
    public List<WordResponseForm> readWordItems(long Degree) {
        List<WordItems> wordItemsList = wordItemsRepository.findAllWordByDegree(Degree);

        List<WordResponseForm> WordItemResponse = new ArrayList<>();

        for(WordItems wordItems : wordItemsList){
            WordItemResponse.add(new WordResponseForm(wordItems.getWord() , wordItems.getMeaning()));
        }

        System.out.println("WordItemResponse :  " + WordItemResponse);

        return WordItemResponse;
    }

    // 차수가 몇개가 있는지 요청받으면 차수 개수를 반환
    @Override
    public long readWordDegreeCnt() {
        return wordsDegreeRepository.count();
    }

    @Override
    public boolean updateWordItems(WordItemsRequest wordItemsRequest) {
        return false;
    }

    @Override
    public boolean deleteWordItems(WordItemsRequest wordItemsRequest) {
        return false;
    }
}
