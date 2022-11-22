package kr.eddi.LeaningHelper.service.learning;

import com.zaxxer.hikari.util.SuspendResumeLock;
import kr.eddi.LeaningHelper.entity.learning.words.WordItems;
import kr.eddi.LeaningHelper.entity.learning.words.WordsDegree;
import kr.eddi.LeaningHelper.request.learning.WordItemsModifyRequest;
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
    @Autowired
    WordsDegreeRepository wordsDegreeRepository;

    @Override
    public boolean createDegree(long degree) {
        try {
            WordsDegree wordsDegree= WordsDegree.builder()
                    .Degree(degree)
                    .build();

            wordsDegreeRepository.save(wordsDegree);
            return true;
        }catch (Exception e){
            System.out.println("오류" + e);
            return false;
        }
    }

    @Override
    public boolean wordItemRegister(WordItemsRequest wordItemsRequest) {
        try {
            Optional<WordsDegree> maybeWordsDegree = wordsDegreeRepository.findDegreeByResponseDegree(wordItemsRequest.getDegree());

            WordsDegree wordsDegree = maybeWordsDegree.get();

            WordItems wordItems = WordItems.builder()
                    .word(wordItemsRequest.getWord())
                    .meaning(wordItemsRequest.getMeaning())
                    .antonym(wordItemsRequest.getAntonym())
                    .synonym(wordItemsRequest.getSynonym())
                    .example(wordItemsRequest.getExample())
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
    public List<WordResponseForm> readWordItems(int Degree) {

        try{
            List<WordItems> wordItemsList = wordItemsRepository.findAllWordByDegree((long) Degree);

            List<WordResponseForm> WordItemResponse = new ArrayList<>();

            for(WordItems wordItems : wordItemsList){
                WordItemResponse.add(new WordResponseForm(
                                wordItems.getId(),
                                wordItems.getWord(),
                                wordItems.getMeaning(),
                                wordItems.getSynonym(),
                                wordItems.getAntonym(),
                                wordItems.getExample()
                        )
                );
            }

            System.out.println("WordItemResponse :  " + WordItemResponse);

            return WordItemResponse;
        }catch (Exception e){
            System.out.println("ㅅㅂ 오류"+e);
        }
        return null;
    }

    // 차수가 몇개가 있는지 요청받으면 차수 개수를 반환
    @Override
    public List<Long> readWordDegreeCnt() {
        List<WordsDegree> wordsDegreeListList = wordsDegreeRepository.findAll();

        List<Long> DegreeList = new ArrayList<>();
        for (WordsDegree wordsDegree : wordsDegreeListList) {
            DegreeList.add(wordsDegree.getDegree());
        }
        return null;
    }

    @Override
    public boolean ModifyWordItem(WordItemsModifyRequest wordItemsModifyRequest) {
        Optional<WordItems> maybeWordItem = wordItemsRepository.findById(wordItemsModifyRequest.getWordId());
        if(maybeWordItem != null){
            WordItems existingItem = maybeWordItem.get();

            existingItem.ModifyWordItems(wordItemsModifyRequest.getWord(),wordItemsModifyRequest.getMeaning(),
                    wordItemsModifyRequest.getSynonym(),wordItemsModifyRequest.getAntonym(),wordItemsModifyRequest.getExample());

            wordItemsRepository.save(existingItem);

            return true;
        }
        return false;
    }

    @Override
    public boolean deleteWordItems(Long WordItemId) {
        try{
            wordItemsRepository.deleteById(WordItemId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
