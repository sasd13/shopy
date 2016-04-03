package com.sasd13.shopy.util.sorter;

import com.sasd13.shopy.bean.Category;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author Samir
 */
public class CategorySorter {
    
    public static void byName(List<Category> categories) {
        byName(categories, false);
    }
	
    public static void byName(List<Category> categories, final boolean byDesc) {
        Collections.sort(categories, new Comparator<Category>() {
            
            @Override
            public int compare(Category category1, Category category2) {
            String name1 = category1.getName();
            String name2 = category2.getName();
            
            return (byDesc)
                    ? name2.compareTo(name1)
                    : name1.compareTo(name2);
            }
        });
    }
}
